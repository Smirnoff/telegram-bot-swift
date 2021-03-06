// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation
import SwiftyJSON

/// A link to an article or web page.
/// - SeeAlso: <https://core.telegram.org/bots/api#inlinequeryresultarticle>
public class InlineQueryResultArticle: JsonObject {
	/// Original JSON for fields not yet added to Swift structures
	public var json: JSON
	
	public required init(json: JSON = [:]) {
		self.json = json
	}
}

