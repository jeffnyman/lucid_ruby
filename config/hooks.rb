AfterConfiguration do |config|
  puts("Feature specs executed from: #{config.feature_dirs}")
end

Before('~@mock', '~@manual') do
  browser_context_start
end

After('~@mock', '~@manual') do
  browser_context_stop
end
