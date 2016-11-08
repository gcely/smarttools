require 'aws-sdk'

module ColaHelper
	def send_msg_to_queue(message)
		client = IronMQ::Client.new(host: ENV['IRON_MQ_HOST'],
									token: ENV['IRON_MQ_TOKEN'],
									project_id: ENV['IRON_MQ_PROJECT_ID'])
		queue = client.queue("smarttools_queue")
		resp = queue.post(message)
	end
	def obtain_message_from_queue
		client = IronMQ::Client.new(host: ENV['IRON_MQ_HOST'],
									token: ENV['IRON_MQ_TOKEN'],
									project_id: ENV['IRON_MQ_PROJECT_ID'])
		queue = client.queue("smarttools_queue")
		resp = queue.reserve(n: 1)
		puts resp.body
		return resp
	end
	def delete_message_from_queue(receipt_handle)
		client = IronMQ::Client.new(host: ENV['IRON_MQ_HOST'],
									token: ENV['IRON_MQ_TOKEN'],
									project_id: ENV['IRON_MQ_PROJECT_ID'])
		queue = client.queue("smarttools_queue")
		resp = queue.delete_reserved_messages(receipt_handle)
	end	
end