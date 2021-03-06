package <%= gwt_resource_package %>;

import com.kaboomerang.gwt.rest.client.resource.Resource;
import com.google.gwt.json.client.JSONObject;
import com.google.gwt.json.client.JSONParser;
import com.google.gwt.json.client.JSONString;
import com.google.gwt.json.client.JSONNumber;
import com.google.gwt.core.client.GWT;
<%- if properties.values.detect { |n| n == 'Date' || n == 'DateOnly' } -%>
import com.google.gwt.i18n.client.DateTimeFormat;
import java.util.Date;
<%- end -%>
import java.util.Iterator;
import java.util.HashMap;
import java.beans.PropertyChangeListener; 
import java.beans.PropertyChangeSupport;
import com.pathf.gwt.util.json.client.JSONWrapper;

/*
 * Generated Base Class. Do not edit.
 *
 * Place custom code in <%= gwt_resource_name %>.java
 *
 * Each migration will overwrite this file.
 *
 */

public class <%= gwt_resource_name %>Base implements Resource {
    protected PropertyChangeSupport changes = new PropertyChangeSupport(this);
<%- if properties.values.detect { |n| n == 'Date' } -%>
    protected DateTimeFormat dateTimeFormat = DateTimeFormat.getFormat("yyyy-MM-dd HH:mm:ss");
<%- end -%>
<%- if properties.values.detect { |n| n == 'DateOnly' } -%>
    protected DateTimeFormat dateOnlyFormat = DateTimeFormat.getFormat("yyyy-MM-dd");
<%- end -%>
<%- properties.keys.each do |k| -%>
    protected <%= properties[k].sub('Only', '') %> <%= k %>;
<%- end -%>
    
    public <%= gwt_resource_name %>Base() {}

    public void populateFromJSONRepresentation(JSONObject json) {
        GWT.log("Populating from representation...", null);

        Iterator i;
        
        for (i = json.keySet().iterator(); i.hasNext();) {
            String key = (String) i.next();
            
<%- first = true -%>
<%- properties.keys.each do |k| -%>
  <%- if first -%>
            if<%- first = false
      else -%>
 else if<%- end -%> ("<%= k.underscore %>".equals(key)) {
                GWT.log(<%= "\"Parsing \\\"#{k.underscore}\\\":\"" %> + json.get(key), null);
     <%- if properties[k] == 'int' -%>
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.<%= k %> = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.<%= k %> = 0;
                }
     <%- elsif properties[k] == 'boolean' -%>
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    int boolNumber = new Double(json.get(key).isNumber().doubleValue()).intValue();
                    if(boolNumber == 1)
                        this.<%= k %> = true;
                    else {
                        this.<%= k %> = false;
                    }
                } else {
                    this.<%= k %> = false;
                }
     <%- elsif properties[k] == 'double' -%>
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.<%= k %> = json.get(key).isNumber().doubleValue();
                } else {
                    this.<%= k %> = 0;
                }
     <%- elsif properties[k] == 'DateOnly' -%>
                JSONString js = json.get(key).isString();
                if (js != null) {
                    //this.<%= k %> = dateOnlyFormat.parse(js.stringValue());
                }
     <%- elsif properties[k] == 'Date' -%>
               JSONString js = json.get(key).isString();
               if (js != null) {
                   //this.<%= k %> = dateTimeFormat.parse(js.stringValue());
               }
     <%- else -%>
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.<%= k %> = js.stringValue();
                } else {
                    this.<%= k %> = "";
                }
     <%- end -%>
            }<%- end -%>
          }

          GWT.log("Finished creating from representation!", null);            
        }
    
    public void populateFromStringRepresentation(String representation) {
        JSONObject json = (JSONObject) JSONParser.parse(representation);
        populateFromJSONRepresentation(json);
    }

    public void populateFromRepresentation(String representation) {
        JSONObject json = (JSONObject) JSONParser.parse(representation);
        populateFromJSONRepresentation(json);
    }
    
    public String toRepresentation() {
        return "{" +
<%- property_count = 1 -%>
<%- properties.keys.each do |k| -%>
            "\"<%= k.underscore %>\": " +
  <%- if properties[k] == 'int' -%>
            <%= k %> +
  <%- elsif properties[k] == 'double' -%>
            new JSONNumber(<%= k %>).toString() +
  <%- elsif properties[k] == 'boolean' -%>
            (<%= k %> ? "true" : "false") +
  <%- elsif properties[k] == 'Date' -%>
            new JSONString(dateTimeFormat.format(<%= k %>)).toString() +
  <%- elsif properties[k] == 'DateOnly' -%>
            new JSONString(dateOnlyFormat.format(<%= k %>)).toString() +
  <%- else -%>
            new JSONString(<%= k %>).toString() +
  <%- end -%>
  <%- if property_count != properties.size -%>
            ", " +
    <%- property_count += 1 -%>
  <%- end -%>
<%- end -%>
            "}";
    }
    
    // Accessors

<%- properties.keys.each do |k| -%>
    public <%= properties[k].sub('Only', '') %> <% " " %><%= properties[k] == 'boolean' ? "is" : "get" -%><%= k.camelize %>() {
        return <%= k %>;
    }
    
    public void set<%= k.camelize %>(<%= properties[k].sub('Only', '') %> <%= k %>) {
        <%= properties[k].sub('Only', '') %> old = this.<%= k %>;
        this.<%= k %> = <%= k %>;
        changes.firePropertyChange("<%= k %>", old, <%= k %>);
    }
    
<%- end -%>
    // Property Change Support
    
    public void addPropertyChangeListener(PropertyChangeListener l) {
        changes.addPropertyChangeListener(l);
    }

    public void addPropertyChangeListener(String propertyName, PropertyChangeListener l) {
        changes.addPropertyChangeListener(propertyName, l);
    }

    public void removePropertyChangeListener(PropertyChangeListener l) {
        changes.removePropertyChangeListener(l);
    }

    public void removePropertyChangeListener(String propertyName, PropertyChangeListener l) {
        changes.removePropertyChangeListener(propertyName, l);
    }
}
