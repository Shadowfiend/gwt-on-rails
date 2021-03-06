<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE module PUBLIC "-//Google Inc.//DTD Google Web Toolkit 1.6.4//EN" "http://google-web-toolkit.googlecode.com/svn/tags/1.6.4/distro-source/core/src/gwt-module.dtd">
<module>
  <!-- Inherit core GWT -->
  <inherits name='com.google.gwt.user.User'/>
  
  <!-- Standard GWT Theme -->
  <inherits name='com.google.gwt.user.theme.standard.Standard'/>
  
  <!-- Inherit property change support -->
  <inherits name='com.googlecode.gwtx.Java'/>

  <!-- Inherit REST-related libraries -->
  <inherits name='com.google.gwt.http.HTTP'/>
  <inherits name='com.google.gwt.json.JSON'/>
  <inherits name='com.kaboomerang.gwt.rest.REST'/>
  
  <!-- Custom JSON Parser Lib -->
  <inherits name='com.pathf.gwt.util.json.jsonwrapper'/>

  <!-- Put Custom Libraries Below -->

  <!-- Specify the app entry point class.  -->
  <entry-point class='<%= gwt_entry_point %>'/> 
</module>
