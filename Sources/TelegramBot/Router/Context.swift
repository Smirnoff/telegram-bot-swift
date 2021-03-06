// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation

public class Context {
	typealias T = Context
	
	static private let emptyMessage = Message()
	
	public let bot: TelegramBot
	public let update: Update
	/// `update.message` shortcut. Make sure that the message exists before using it,
	/// otherwise it will be empty. For paths supported by Router the message is guaranteed to exist.
	public var message: Message = {
		print("WARNING: dereferencing an empty message")
		return T.emptyMessage
	}()
	public let args: Arguments

	public var privateChat: Bool { return message.chat.type == .private_chat }
	public var chatId: Int64 { return message.chat.id }
	public var fromId: Int64? { return message.from?.id }
	
	init(bot: TelegramBot, update: Update, scanner: NSScanner, command: String) {
		self.bot = bot
		self.update = update
		if let message = update.message {
			self.message = message
		}
		self.args = Arguments(scanner: scanner, command: command)
	}
	
	public func respondAsync(_ text: String,
	                         _ parameters: [String: Any?] = [:],
	                         queue: dispatch_queue_t = dispatch_get_main_queue(),
	                         completion: TelegramBot.SendMessageCompletion? = nil) {
		bot.sendMessageAsync(chat_id: chatId, text: text, parameters, queue: queue, completion: completion)
	}
	
	@discardableResult
	public func respondSync(_ text: String,
	                        parameters: [String: Any?] = [:]) -> Message? {
		return bot.sendMessageSync(chat_id: chatId, text: text, parameters)
	}
	
	@discardableResult
	public func respondPrivatelySync(_ userText: String, groupText: String) -> (userMessage: Message?, groupMessage: Message?) {
		var userMessage: Message?
		if let fromId = fromId {
			userMessage = bot.sendMessageSync(chat_id: fromId, text: userText)
		}
		let groupMessage: Message?
		if !privateChat {
			groupMessage = bot.sendMessageSync(chat_id: chatId, text: groupText)
		} else {
			groupMessage = nil
		}
		return (userMessage, groupMessage)
	}
	
	public func respondPrivatelyAsync(_ userText: String, groupText: String,
	                                  onDidSendToUser userCompletion: TelegramBot.SendMessageCompletion? = nil,
	                                  onDidSendToGroup groupCompletion: TelegramBot.SendMessageCompletion? = nil) {
		if let fromId = fromId {
			bot.sendMessageAsync(chat_id: fromId, text: userText, completion: userCompletion)
		}
		if !privateChat {
			bot.sendMessageAsync(chat_id: chatId, text: groupText, completion: groupCompletion)
		}
	}
	
	public func reportErrorSync(text: String, errorDescription: String) {
		bot.reportErrorSync(chatId: chatId, text: text, errorDescription: errorDescription)
	}

	public func reportErrorSync(errorDescription: String) {
		bot.reportErrorSync(chatId: chatId, errorDescription: errorDescription)
	}

	public func reportErrorAsync(text: String, errorDescription: String, completion: TelegramBot.SendMessageCompletion? = nil) {
		bot.reportErrorAsync(chatId: chatId, text: text, errorDescription: errorDescription, completion: completion)
	}
	
	public func reportErrorAsync(errorDescription: String, completion: TelegramBot.SendMessageCompletion? = nil) {
		bot.reportErrorAsync(chatId: chatId, errorDescription: errorDescription, completion: completion)
	}
}
