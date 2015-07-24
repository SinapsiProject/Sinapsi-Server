package com.sinapsi.webservice.web;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bgp.decryption.Decrypt;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sinapsi.engine.execution.RemoteExecutionDescriptor;
import com.sinapsi.model.DeviceInterface;
import com.sinapsi.model.UserInterface;
import com.sinapsi.webservice.db.DeviceDBManager;
import com.sinapsi.webservice.db.KeysDBManager;
import com.sinapsi.webservice.engine.WebServiceEngine;
import com.sinapsi.webservice.engine.WebServiceGsonManager;
import com.sinapsi.webservice.system.WebServiceConsts;
import com.sinapsi.webservice.utility.BodyReader;
import com.sinapsi.webservice.websocket.Server;
import com.sinapsi.webshared.wsproto.SinapsiMessageTypes;
import com.sinapsi.webshared.wsproto.WebSocketMessage;

/**
 * Remote execution macro system
 * 
 */
@WebServlet("/remote_macro")
public class RemoteMacroExecution extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson;
	private WebServiceEngine engine;
	private KeysDBManager keysManager;
	private DeviceDBManager deviceManager;
	private Decrypt decrypter;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		gson = WebServiceGsonManager.defaultSinapsiGsonBuilder().create();
		
		engine = (WebServiceEngine) getServletContext().getAttribute("engine");
		keysManager = (KeysDBManager) getServletContext().getAttribute("keys_db");
		deviceManager = (DeviceDBManager) getServletContext().getAttribute("devices_db");
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// empty body
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("application/json");
	   
	    int deviceTarget = Integer.parseInt(request.getParameter("to_device"));
	    int fromDevice = Integer.parseInt(request.getParameter("from_device"));
	    Server wsserver = (Server) getServletContext().getAttribute("wsserver");
	   
	    // read the encrypted jsoned body
        String cryptedJsonBody = BodyReader.read(request);
        String cryptedString = gson.fromJson(cryptedJsonBody, new TypeToken<String>() {}.getType());
       
        try {
            DeviceInterface device = deviceManager.getDevice(fromDevice);
            String email = deviceManager.getUserEmail(fromDevice);
 
            if(WebServiceConsts.ENCRYPTED_CONNECTION)
                decrypter = new Decrypt(keysManager.getServerPrivateKey(email, device.getName(), device.getModel()), 
                                        keysManager.getUserSessionKey(email, device.getName(), device.getModel()));
            //decrypt the jsoned body
            String jsonBody;
            if(WebServiceConsts.ENCRYPTED_CONNECTION)
            	jsonBody = decrypter.decrypt(cryptedString);
            else
            	jsonBody = cryptedJsonBody;
            
            RemoteExecutionDescriptor RED = gson.fromJson(jsonBody,new TypeToken<RemoteExecutionDescriptor>() {}.getType());
            
            if(deviceManager.getInfoDevice(deviceTarget).getKey().equals("Cloud") &&
               deviceManager.getInfoDevice(deviceTarget).getValue().equals("Sinapsi")) {
               
               UserInterface user = deviceManager.getUserDevice(fromDevice);
               engine.getEngineForUser(user).continueMacro(RED);
            
            } else {                
                WebSocketMessage message = new WebSocketMessage(SinapsiMessageTypes.REMOTE_EXECUTION_DESCRIPTOR, gson.toJson(RED));
                
                wsserver.send(deviceTarget, gson.toJson(message));  
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
       
	}

}
