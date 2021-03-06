// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation
import SwiftyJSON

/// Represents a sticker.
/// - SeeAlso: <https://core.telegram.org/bots/api#sticker>
public class Sticker: JsonObject {
	/// Original JSON for fields not yet added to Swift structures
	public var json: JSON

    /// Unique identifier for this file.
	public var file_id: String {
		get { return json["file_id"].stringValue }
		set { json["file_id"].stringValue = newValue }
	}
		
    /// Sticker width.
	public var width: Int {
		get { return json["width"].intValue }
		set { json["width"].intValue = newValue }
	}
		
    /// Sticker height.
	public var height: Int {
		get { return json["height"].intValue }
		set { json["height"].intValue = newValue }
	}
		
    /// Sticker thumbnail in .webp or .jpg format.
	public var thumb: PhotoSize {
		get { return PhotoSize(json: json["thumb"]) }
		set { json["thumb"] = newValue.json }
	}
	
	/// *Optional.* Emoji associated with the sticker.
	public var emoji: String? {
		get { return json["emoji"].string }
		set { json["emoji"].string = newValue }
	}

    /// *Optional.* File size.
	public var file_size: Int? {
		get { return json["file_size"].int }
		set { json["file_size"].int = newValue }
	}
	
	public required init(json: JSON = [:]) {
		self.json = json
	}
}

