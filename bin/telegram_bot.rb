#!/usr/bin/env ruby

begin
  ENV['BOT_POLLER_MODE'] = 'true'
  require_relative '../config/environment'
  Telegram::Bot::UpdatesPoller.start(:default)
rescue Exception => e
  Sentry.capture_exception(e) && !e.is_a?(SystemExit)
  raise
end