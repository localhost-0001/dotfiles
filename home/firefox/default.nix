{
  home-manager.users.henry.programs.firefox = {
    enable = true;
    profiles.default.settings = {
      # BetterFox
      # "Ad meliora."
      # version: August 2021
      # url: https://github.com/yokoffing/Better-Fox
      # license: https://github.com/yokoffing/Better-Fox/blob/master/LICENSE
      # README: https://github.com/yokoffing/Better-Fox/blob/master/README.md

      # SECTION: FASTFOX
      "gfx.webrender.all" = true;
      "browser.sessionstore.restore_pinned_tabs_on_demand" = true;
      "browser.startup.preXulSkeletonUI" = false;

      # SECTION: SECUREFOX
      # TRACKING PROTECTION
      "browser.contentblocking.category" = "strict";
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;
      "urlclassifier.trackingSkipURLs" = "*.twitter.com = *.twimg.com";
      "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com = *.twitter.com = *.twimg.com";
      "beacon.enabled" = false;
      "dom.battery.enabled" = false;
      "security.pki.crlite_mode" = 2;
      "security.remote_settings.crlite_filters.enabled" = true;
      "dom.storage.next_gen" = true;

      # CLEARING DATA DEFAULTS
      "privacy.cpd.history" = true;
      "privacy.cpd.formdata" = true;
      "privacy.cpd.offlineApps" = true;
      "privacy.cpd.cache" = true;
      "privacy.cpd.cookies" = true;
      "privacy.cpd.sessions" = true;
      "privacy.cpd.siteSettings" = false;
      "privacy.sanitize.timeSpan" = 0;
      "privacy.history.custom" = true;

      # SPECULATIVE CONNECTIONS
      "network.predictor.enable-hover-on-ssl" = true;
      "network.predictor.enable-prefetch" = true;
      "network.dns.disablePrefetch" = true;
      "network.dns.disablePrefetchFromHTTPS" = false;
      "network.preload" = false;

      # SEARCH / URL BAR
      "browser.search.separatePrivateDefault" = true;
      "browser.search.separatePrivateDefault.ui.enabled" = true;
      "browser.search.suggest.enabled" = false;
      "browser.fixup.alternate.enabled" = false;
      "security.insecure_connection_text.enabled" = true;
      "security.insecure_connection_text.pbmode.enabled" = true;
      "network.IDN_show_punycode" = true;

      # HTTPS-FIRST POLICY
      "dom.security.https_first" = true;

      # HTTPS-ONLY MODE
      "dom.security.https_only_mode_pbm" = true;
      "dom.security.https_only_mode_ever_enabled_pbm" = true;
      "dom.security.https_only_mode_send_http_background_request" = false;
      "dom.security.https_only_mode.upgrade_local" = true;

      # DNS-over-HTTPS (DOH
      "network.trr.send_user-agent_headers" = false;
      "network.dns.skipTRR-when-parental-control-enabled" = false;

      # ESNI / ECH
      "network.dns.echconfig.enabled" = true;
      "network.dns.use_https_rr_as_altsvc" = true;

      # PASSWORDS AND AUTOFILL
      "signon.autofillForms.http" = false;
      "security.insecure_field_warning.contextual.enabled" = true;
      "signon.privateBrowsingCapture.enabled" = false;
      # NOTE: Remove everything below this line if you use Firefox's password manager
      "signon.management.page.breach-alerts.enabled" = false;
      "signon.management.page.breachAlertUrl" = "";
      "browser.contentblocking.report.lockwise.enabled" = false;
      "browser.contentblocking.report.lockwise.how_it_works.url" = "";
      "signon.rememberSignons" = false;
      "signon.rememberSignons.visibilityToggle" = false;
      "signon.schemeUpgrades" = false;
      "signon.showAutoCompleteFooter" = false;
      "signon.autologin.proxy" = false;
      "signon.debug" = false;
      "signon.generation.available" = false;
      "signon.generation.enabled" = false;
      "signon.management.page.fileImport.enabled" = false;
      "signon.importedFromSqlite" = false;
      "signon.recipes.path" = "";
      "signon.autofillForms" = false;
      "signon.autofillForms.autocompleteOff" = true;
      "signon.showAutoCompleteOrigins" = false;
      "signon.storeWhenAutocompleteOff" = false;
      "signon.formlessCapture.enabled" = false;
      "extensions.fxmonitor.enabled" = false;

      # ADDRESS + CREDIT CARD MANAGER
      "extensions.formautofill.addresses.enabled" = false;
      "extensions.formautofill.available" = "off";
      "extensions.formautofill.creditCards.available" = false;
      "extensions.formautofill.creditCards.enabled" = false;
      "extensions.formautofill.heuristics.enabled" = false;
      "browser.formfill.enable" = false;

      # MIXED CONTENT + CROSS-SITE
      "network.auth.subresource-http-auth-allow" = 1;
      "network.http.windows-sso.enabled" = false;
      "security.mixed_content.upgrade_display_content" = true;
      "dom.block_download_insecure" = true;
      "pdfjs.enableScripting" = false;
      "extensions.postDownloadThirdPartyPrompt" = false;
      "permissions.delegation.enabled" = false;
      "network.http.referer.XOriginTrimmingPolicy" = 2;

      # GOOGLE SAFE BROWSING
      "browser.safebrowsing.downloads.remote.enabled" = false;
      "browser.safebrowsing.downloads.remote.url" = "";
      # WARNING: Be sure to have alternate security measures if you disable Safe Browsing!
      # NOTE: Remove everything below this line if you use this feature
      "browser.safebrowsing.malware.enabled" = false;
      "browser.safebrowsing.phishing.enabled" = false;
      "browser.safebrowsing.downloads.enabled" = false;
      "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
      "browser.safebrowsing.downloads.remote.block_uncommon" = false;

      # MOZILLA
      "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";

      # TELEMETRY
      "toolkit.telemetry.unified" = false;
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.server" = "data: =";
      "toolkit.telemetry.archive.enabled" = false;
      "toolkit.telemetry.newProfilePing.enabled" = false;
      "toolkit.telemetry.shutdownPingSender.enabled" = false;
      "toolkit.telemetry.updatePing.enabled" = false;
      "toolkit.telemetry.bhrPing.enabled" = false;
      "toolkit.telemetry.firstShutdownPing.enabled" = false;
      "corroborator.enabled" = false;
      "toolkit.telemetry.coverage.opt-out" = true;
      "toolkit.coverage.opt-out" = true;
      "datareporting.healthreport.uploadEnabled" = false;
      "datareporting.policy.dataSubmissionEnabled" = false;
      "app.shield.optoutstudies.enabled" = false;
      "browser.discovery.enabled" = false;
      "browser.tabs.crashReporting.sendReport" = false;
      "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
      "default-browser-agent.enabled" = false;
      "extensions.abuseReport.enabled" = false;
      "app.normandy.enabled" = false;
      "browser.ping-centre.telemetry" = false;
      "browser.newtabpage.activity-stream.feeds.telemetry" = false;
      "browser.newtabpage.activity-stream.telemetry" = false;

      # SECTION: PESKYFOX

      # MOZILLA UI
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.privatebrowsing.vpnpromourl" = "";
      "extensions.getAddons.showPane" = false;
      "extensions.htmlaboutaddons.recommendations.enabled" = false;
      "browser.shell.checkDefaultBrowser" = false;
      "browser.aboutwelcome.enabled" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
      "security.dialog_enable_delay" = 0;
      "extensions.webextensions.restrictedDomains" = "accounts-static.cdn.mozilla.net =accounts.firefox.com =addons.cdn.mozilla.net =api.accounts.firefox.      com =content.cdn.mozilla.net =discovery.addons.mozilla.org =install.mozilla.org =oauth.accounts.firefox.com =profile.accounts.firefox.com =support.     mozilla.org =sync.services.mozilla.com";

      # WARNINGS
      "browser.tabs.warnOnClose" = false;
      "browser.tabs.warnOnCloseOtherTabs" = false;
      "browser.tabs.warnOnOpen" = false;
      "browser.aboutConfig.showWarning" = false;

      # FULLSCREEN
      "full-screen-api.transition-duration.enter" = "0 0";
      "full-screen-api.transition-duration.leave" = "0 0";
      "full-screen-api.warning.delay" = -1;
      "full-screen-api.warning.timeout" = -1;

      # NEW TAB PAGE
      "browser.startup.page" = 3;
      "browser.newtabpage.activity-stream.discoverystream.enabled" = false;
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      "browser.newtabpage.activity-stream.feeds.topsites" = false;
      "browser.newtabpage.activity-stream.feeds.snippets" = false;
      "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
      "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
      "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
      "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
      "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
      "browser.startup.homepage_override.mstone" = "ignore";
      "browser.messaging-system.whatsNewPanel.enabled" = false;

      #* POCKET
      "extensions.pocket.enabled" = false;
      "extensions.pocket.api" =" ";
      "extensions.pocket.oAuthConsumerKey" = " ";
      "extensions.pocket.site" = " ";

      # DOWNLOADS
      "browser.download.useDownloadDir" = false;
      "browser.download.manager.addToRecentDocs" = false;

      # VARIOUS
      "browser.compactmode.show" = true;
      "browser.menu.showViewImageInfo" = true;
      "browser.urlbar.suggest.engines" = false;
      "browser.urlbar.suggest.topsites" = false;
      "permissions.default.desktop-notification" = 2;
      "dom.push.enabled" = false;
      "findbar.highlightAll" = true;
      "layout.spellcheckDefault" = 2;
      "accessibility.force_disabled" = 1;
      "browser.bookmarks.max_backups" = 2;
      "browser.display.show_image_placeholders" = false;
      "view_source.wrap_long_lines" = true;
      "devtools.debugger.ui.editor-wrapping" = true;

      # TAB BEHAVIOR
      "dom.disable_window_move_resize" = true;
      "browser.tabs.loadBookmarksInTabs" = true;
      "browser.bookmarks.openInTabClosesMenu" = false;
      "image.avif.enabled" = true;
      "editor.truncate_user_pastes" = false;
      "media.videocontrols.picture-in-picture.video-toggle.has-used" = true;
      "clipboard.plainTextOnly" = true;
      "dom.popup_allowed_events" = "click dblclick mousedown pointerdown";

      # END: BETTERFOX

      # Poultryghast's config starts here

      # Disable picture-in-picture mode
      "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

      # Dark mode
      "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

      # Disable bookmarks
      "browser.toolbars.bookmarks.visibility" = "never";

      # Clean up search bar
      "browser.search.hiddenOneOffs" = "Google,Amazon.com,Bing,DuckDuckGo,Wikipedia (en),eBay";
      "browser.urlbar.shortcuts.bookmarks" = false;
      "browser.urlbar.shortcuts.history" = false;
      "browser.urlbar.shortcuts.tabs" = false;
      "browser.urlbar.suggest.bookmark" = false;
      "browser.urlbar.suggest.history" = false;
      "browser.urlbar.suggest.openpage" = false;
      "browser.urlbar.suggest.searches" = false;
    };
  };
}