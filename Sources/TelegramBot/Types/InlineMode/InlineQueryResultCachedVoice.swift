// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation
import SwiftyJSON

/// A link to a voice message stored on the Telegram servers. By default, this voice message will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the voice message.
/// - SeeAlso: <https://core.telegram.org/bots/api#inlinequeryresultcachedvoice>
public class InlineQueryResultCachedVoice: JsonObject {
	/// Original JSON for fields not yet added to Swift structures
	public var json: JSON
	
	public required init(json: JSON = [:]) {
		self.json = json
	}
}

