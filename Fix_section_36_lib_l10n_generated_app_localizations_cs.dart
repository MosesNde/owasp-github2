 
   @override
   String get add_custom_url => 'Přidat vlastní URL';

  @override
  String get edit_port => 'Upravit port';

  @override
  String get port_helper_msg => 'Výchozí hodnota je -1, což znamená náhodné číslo. Pokud máte nakonfigurován firewall, doporučuje se to nastavit.';

  @override
  String connect_request(Object client) {
    return 'Povolit $client připojení?';
  }

  @override
  String get connection_request_denied => 'Připojení bylo zamítnuto. Uživatel odmítl přístup.';
 }