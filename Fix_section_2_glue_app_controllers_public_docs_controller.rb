 class Public::DocsController < ActionController::Base
 
  protect_from_forgery with: :exception

   include SetCurrentUserAndOrganization
   include SetLocale
   include HighVoltage::StaticPage