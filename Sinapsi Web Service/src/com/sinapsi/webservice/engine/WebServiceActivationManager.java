package com.sinapsi.webservice.engine;

import com.sinapsi.engine.activation.ActivationManager;
import com.sinapsi.engine.component.Trigger;

/**
 * Web service activation manager of Sinapsi
 * @author Aleph0
 *
 */
public class WebServiceActivationManager extends ActivationManager {
    
    @Override
    public void addToNotifyList(Trigger t) {
        super.addToNotifyList(t);
        //il Trigger t da questo momento deve essere attivato quando si verifica
        //  l'evento specifico
    }

    @Override
    public void removeFromNotifyList(Trigger t) {
        super.removeFromNotifyList(t);
        //il Trigger t da questo momento non deve essere piu' attivato
    }

}
