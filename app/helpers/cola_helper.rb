require 'aws-sdk'

#module ColaHelper
#	def send_msg_to_queue(message)
#		client = IronMQ::Client.new(host: ENV['IRON_MQ_HOST'],
#									token: ENV['IRON_MQ_TOKEN'],
#									project_id: ENV['IRON_MQ_PROJECT_ID'])
#		queue = client.queue("smarttools_queue")
#		resp = queue.post(message)
#	end
#	def obtain_message_from_queue
#		client = IronMQ::Client.new(host: ENV['IRON_MQ_HOST'],
#									token: ENV['IRON_MQ_TOKEN'],
#									project_id: ENV['IRON_MQ_PROJECT_ID'])
#		queue = client.queue("smarttools_queue")
#		resp = queue.reserve(n: 1)
#		return resp
#	end
#	def delete_message_from_queue(msg)
#		client = IronMQ::Client.new(host: ENV['IRON_MQ_HOST'],
#									token: ENV['IRON_MQ_TOKEN'],
#									project_id: ENV['IRON_MQ_PROJECT_ID'])
#		queue = client.queue("smarttools_queue")
#		message = queue.delete(msg.id, msg.reservation_id)
#		puts "id_res" + msg.reservation_id
#		#queue.delete_reserved_messages(msg)
#	end	
#end

module ColaHelper
	def send_msg_to_queue(message)
		client = AWS::SQS::Client.new(region: 'us-east-1')
		resp = client.send_message({
			queue_url: 'https://sqs.us-east-1.amazonaws.com/919584528975/smarttools-queue',
			message_body: message,
		})
	end
	def obtain_message_from_queue
		client = AWS::SQS::Client.new(region: 'us-east-1')
		resp = client.receive_message({
			queue_url: 'https://sqs.us-east-1.amazonaws.com/919584528975/smarttools-queue',
			max_number_of_messages: 1,
		})
		return resp.messages
	end
	def delete_message_from_queue(receipt_handle)
		client = AWS::SQS::Client.new(region: 'us-east-1')
		resp = client.delete_message({
			queue_url: 'https://sqs.us-east-1.amazonaws.com/919584528975/smarttools-queue',
			receipt_handle: receipt_handle,
		})
	end	
end