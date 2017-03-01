import Cocoa

let textStorage = TextStorage()
let layoutManger = NSLayoutManager()
let textContainer = NSTextContainer(containerSize: NSSize(width: 180, height: 24))

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        textStorage.addLayoutManager(layoutManger)
        layoutManger.addTextContainer(textContainer)
        let textView = NSTextView(frame: NSRect(x: 10, y: 18, width: 180, height: 22), textContainer: textContainer)
        window.contentView?.addSubview(textView)
        window.makeFirstResponder(textView)
    }
}

// Bare minimum NSTextStorage concrete implementation.
public final class TextStorage: NSTextStorage {

    public override var string: String {
        return storage.string
    }

    public override func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [String : Any] {
        return storage.attributes(at: location, effectiveRange: range)
    }

    public override func replaceCharacters(in range: NSRange, with str: String) {
        let initialLength = storage.length
        storage.replaceCharacters(in: range, with: str)
        let delta = storage.length - initialLength
        edited([.editedCharacters], range: range, changeInLength: delta)
    }

    public override func setAttributes(_ attrs: [String : Any]?, range: NSRange) {
        storage.setAttributes(attrs, range: range)
        edited([.editedAttributes], range: range, changeInLength: 0)
    }

    private let storage = NSMutableAttributedString()
}
