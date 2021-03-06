// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation
import SwiftyJSON

/// Represents an audio file to be treated as music by the Telegram clients.
/// - SeeAlso: <https://core.telegram.org/bots/api#audio>
public class Audio: JsonObject {
	/// Original JSON for fields not yet added to Swift structures
	public var json: JSON
    
    /// Unique identifier for this file.
	public var file_id: String {
		get { return json["file_id"].stringValue }
		set { json["file_id"].stringValue = newValue }
	}
		
    /// Duration of the audio in seconds as defined by sender.
	public var duration: Int {
		get { return json["duration"].intValue }
		set { json["duration"].intValue = newValue }
	}
	
	/// *Optional.* Performer of the audio as defined by sender or by audio tags.
	public var performer: String? {
		get { return json["performer"].string }
		set { json["performer"].string = newValue }
	}
	
	/// *Optional.* Title of the audio as defined by sender or by audio tags.
	public var title: String? {
		get { return json["title"].string }
		set { json["title"].string = newValue }
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

