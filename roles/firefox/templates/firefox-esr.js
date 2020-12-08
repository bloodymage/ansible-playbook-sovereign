// This is the Debian specific preferences file for Firefox ESR
// You can make any change in here, it is the purpose of this file.
// You can, with this file and all files present in the
// /etc/firefox-esr directory, override any preference you can see in
// about:config.
//
// Note that pref("name", value, locked) is allowed in these
// preferences files if you don't want users to be able to override
// some preferences.

pref("extensions.update.enabled", true);

// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Disable openh264.
pref("media.gmp-gmpopenh264.enabled", false);

// Default to classic view for about:newtab
pref("browser.newtabpage.enhanced", false, sticky);

// Disable health report upload
pref("datareporting.healthreport.uploadEnabled", false);

// Default to no suggestions in the urlbar. This still brings a panel asking
// the user whether they want to opt-in on first use.
pref("browser.urlbar.suggest.searches", false);

// SSO
pref("network.automatic-ntlm-auth.allow-non-fqdn", true);
pref("network.automatic-ntlm-auth.trusted-uris", "cloud.drbr.org,wiki,wiki.olympus.drbr.org,.drbr.org");
pref("network.negotiate-auth.allow-non-fqdn", true);
pref("network.negotiate-auth.delegation-uris", "cloud.drbr.org,wiki,wiki.olympus.drbr.org,.drbr.org");
pref("network.negotiate-auth.trusted-uris", "cloud.drbr.org,wiki,wiki.olympus.drbr.org,.drbr.org");
pref("network.negotiate-auth.using-native-gsslib", false);
pref("network.negotiate-auth.gsslib", "/usr/lib/x86_64-linux-gnu/libgssapi_krb5.so.2");
