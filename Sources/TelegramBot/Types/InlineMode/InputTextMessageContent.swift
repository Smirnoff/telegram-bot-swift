// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation
import SwiftyJSON

/// Content of a text message to be sent as the result of an inline query.
/// - SeeAlso: <https://core.telegram.org/bots/api#inputtextmessagecontent>
public class InputTextMessageContent: JsonObject {
	/// Original JSON for fields not yet added to Swift structures
	public var json: JSON
	
	public required init(json: JSON = [:]) {
		self.json = json
	}
}

