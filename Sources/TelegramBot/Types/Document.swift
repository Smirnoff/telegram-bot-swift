// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation
import SwiftyJSON

/// Represents a general file (as opposed to photos, voice messages and audio files).
/// - SeeAlso: <https://core.telegram.org/bots/api#document>
public class Document: JsonObject {
	/// Original JSON for fields not yet added to Swift structures
	public var json: JSON
	
    /// Unique file identifier.
	public var file_id: String {
		get { return json["file_id"].stringValue }
		set { json["file_id"].stringValue = newValue }
	}
		
    /// Document thumbnail as defined by sender.
	public var thumb: PhotoSize {
		get { return PhotoSize(json: json["thumb"]) }
		set { json["thumb"] = newValue.json }
	}
		
    /// *Optional.* Original filename as defined by sender.
	public var file_name: String? {
		get { return json["file_name"].string }
		set { json["file_name"].string = newValue }
	}
		
    /// *Optional.* MIME type of the file as defined by sender.
	public var mime_type: String? {
		get { return json["mime_type"].string }
		set { json["mime_type"].string = newValue }
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
