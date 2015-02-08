module ApplicationHelper
	def flash_message
		messages = Hash.new
		[:notice, :info, :warning, :error].each do |type|
		  if flash[type]
			messages.store(type, flash[type])
		  end
		end
		return messages
	end
end
