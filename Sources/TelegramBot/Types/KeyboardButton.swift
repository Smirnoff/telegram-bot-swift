// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation
import SwiftyJSON

/// Represents one button of the reply keyboard. For simple text buttons String can be used instead of this object to specify text of the button. Optional fields are mutually exclusive.
/// - SeeAlso: <https://core.telegram.org/bots/api#keyboardbutton>
public class KeyboardButton: JsonObject {
	/// Original JSON for fields not yet added to Swift structures
	public var json: JSON
	
	/// Text of the button. If none of the optional fields are used, it will be sent to the bot as a message when the button is pressed.
	public var text: String {
		get { return json["text"].stringValue }
		set { json["text"].stringValue = newValue }
	}
	
	/// *Optional.* If True, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only.
	public var request_contact: Bool? {
		get { return json["request_contact"].bool }
		set { json["request_contact"].bool = newValue }
	}

	/// *Optional.* If True, the user's current location will be sent when the button is pressed. Available in private chats only.
	public var request_location: Bool? {
		get { return json["request_location"].bool }
		set { json["request_location"].bool = newValue }
	}
	
	public required init(json: JSON = [:]) {
		self.json = json
	}
}
