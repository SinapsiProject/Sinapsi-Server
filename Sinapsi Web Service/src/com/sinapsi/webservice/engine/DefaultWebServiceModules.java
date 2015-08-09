package com.sinapsi.webservice.engine;

import com.sinapsi.engine.SinapsiPlatforms;
import com.sinapsi.engine.SinapsiVersions;
import com.sinapsi.engine.modules.DefaultCoreModules;
import com.sinapsi.model.impl.FactoryModel;
import com.sinapsi.model.module.SinapsiModule;
import com.sinapsi.webservice.engine.components.ActionSendEmail;
import com.sinapsi.webservice.engine.components.TriggerEmailReceived;
import com.sinapsi.webservice.engine.system.EmailAdapter;

public class DefaultWebServiceModules {

	public static final String ANTARES_WEB_SERVICE_MODULE_NAME = "ANTARES_WEB_SERVICE_MODULE";
	
	public static final SinapsiModule ANTARES_WEB_SERVICE_MODULE = new FactoryModel().newModule(
			SinapsiVersions.ANTARES.ordinal(),
			SinapsiVersions.ANTARES.ordinal(),
			ANTARES_WEB_SERVICE_MODULE_NAME,
			DefaultCoreModules.SINAPSI_TEAM_DEVELOPER_ID,
			SinapsiPlatforms.PLATFORM_WEB_SERVICE,
			null, 
			null, 
			null, 
			null, 
			
			ActionSendEmail.class,
			TriggerEmailReceived.class,
			
			EmailAdapter.class);
	
	private DefaultWebServiceModules(){} //Don't instantiate pls
}
