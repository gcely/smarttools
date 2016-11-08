
HireFire::Resource.configure do |config|
  config.dyno(:worker) do
	client = IronMQ::Client.new(host: ENV['IRON_MQ_HOST'],
									token: ENV['IRON_MQ_TOKEN'],
									project_id: ENV['IRON_MQ_PROJECT_ID'])
	queue = client.queue("smarttools_queue")
    HireFire::Macro::Sqs.queue
  end
end