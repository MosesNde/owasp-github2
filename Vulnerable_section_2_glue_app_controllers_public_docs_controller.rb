 class Public::DocsController < ActionController::Base
 
   include SetCurrentUserAndOrganization
   include SetLocale
   include HighVoltage::StaticPage