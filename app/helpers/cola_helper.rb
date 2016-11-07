require 'aws-sdk'

module ColaHelper
	def send_msg_to_queue(message)
		client = IronMQ::Client.new(host: 'mq-aws-eu-west-1-1.iron.io',
									token: '78lTkar7aFpExwRfr2Vp',
									project_id: '581fed5fbccbd80006c37c72')
		queue = client.queue("smarttools_queue")
		resp = queue.post('mensaje ')
	end
	def obtain_message_from_queue
		client = IronMQ::Client.new(host: ENV['IRON_QUE_HOST'],
									token: ENV['IRON_QUE_TOKEN'],
									project_id: ENV['IRON_QUE_ID'])
		resp = client.receive_message({
			queue_url: 'mq-aws-eu-west-1-1.iron.io',
			max_number_of_messages: 1,
		})
		return resp.messages
	end
	def delete_message_from_queue(receipt_handle)
		client = IronMQ::Client.new(host: ENV['IRON_QUE_HOST'],
									token: ENV['IRON_QUE_TOKEN'],
									project_id: ENV['IRON_QUE_ID'])
		resp = client.delete_message({
			queue_url: 'mq-aws-eu-west-1-1.iron.io',
			receipt_handle: receipt_handle,
		})
	end	
end