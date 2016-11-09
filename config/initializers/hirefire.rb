
HireFire::Resource.configure do |config|
  config.dyno(:worker) do
    HireFire::Macro::Sqs.queue("smarttools_queue")
  end
end