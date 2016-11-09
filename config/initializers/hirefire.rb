#client = IronMQ::Client.new(host: ENV['IRON_MQ_HOST'],
#									token: ENV['IRON_MQ_TOKEN'],
#									project_id: ENV['IRON_MQ_PROJECT_ID'])
#	queue = client.queue("smarttools_queue")


HireFire::Resource.configure do |config|
  config.dyno(:worker) do
	
    HireFire::Macro::Sqs.queue("smarttools_queue")
  end
end