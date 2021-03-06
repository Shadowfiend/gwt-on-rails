package <%= gwt_entry_point_package %>;

import com.google.gwt.core.client.GWT;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.ClickListener;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.Widget;

import com.kaboomerang.gwt.rest.client.resource.*;
import com.kaboomerang.gwt.rest.client.resource.impl.*;
import com.kaboomerang.gwt.rest.client.handler.*;
import com.kaboomerang.gwt.rest.client.callback.*;
import com.kaboomerang.gwt.rest.client.uri.*;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class <%= class_name %> implements EntryPoint {

    /**
     * This is the entry point method.
     */
    public void onModuleLoad() {
        final Button button = new Button("Click me");
        final Label label = new Label();

        button.addClickListener(new ClickListener() {
            public void onClick(Widget sender) {
                if (label.getText().equals(""))
                    label.setText("Hello World!");
                else
                    label.setText("");
            }
        });

        // Assume that the host HTML has elements defined whose
        // IDs are "slot1", "slot2".  In a real app, you probably would not want
        // to hard-code IDs.  Instead, you could, for example, search for all 
        // elements with a particular CSS class and replace them with widgets.
        //
        RootPanel.get("slot1").add(button);
        RootPanel.get("slot2").add(label);
    }
}
