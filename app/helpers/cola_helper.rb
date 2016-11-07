require 'aws-sdk'

module ColaHelper
	def send_msg_to_queue(message)
		client = IronMQ::Client.new(host: ENV['IRON_QUE_HOST'],
									token: ENV['IRON_QUE_TOKEN'],
									project_id: ENV['IRON_QUE_ID'])
		queue = client.queue("smarttools_queue")
		resp = queue.post(message)
	end
	def obtain_message_from_queue
		client = IronMQ::Client.new(host: ENV['IRON_QUE_HOST'],
									token: ENV['IRON_QUE_TOKEN'],
									project_id: ENV['IRON_QUE_ID'])
		queue = client.queue("smarttools_queue")
		resp = queue.get()
		puts resp.body
		return resp.body
	end
	def delete_message_from_queue(receipt_handle)
		client = IronMQ::Client.new(host: ENV['IRON_QUE_HOST'],
									token: ENV['IRON_QUE_TOKEN'],
									project_id: ENV['IRON_QUE_ID'])
		queue = client.queue("smarttools_queue")
		resp = queue.delete_reserved_messages(receipt_handle)
	end	
end