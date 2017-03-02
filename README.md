Sample project to demo radar 30803161

Using a subclass of NSTextStorage as the backing storage for a text view (even without any custom code in that storage layer) results in an exception being thrown whenever the user selects a suggestion from the touch bar.

1. Run project
2. Try to select any of the suggestions in the touch bar

---

# Title

Out of Bounds Exception Using Touch Bar + NSTextStorage Subclass

# Description

When using a subclass of NSTextStorage as the storage for NSTextView, even with no custom behavior (just delegating to a NSMutableAttributedString) an out of bounds exception is thrown any time a suggestion/spell-correction is selected in the touch bar.

# Steps to reproduce

This is probably easiest to see in the sample project attached.

1. Provide a subclass of NSTextStorage as the backing storage for NSTextView
2. Add the NSTextView to the window
3. Make the text view first responder
4. After launching the app select a suggestion in the touch bar on a touch bar MacBook

# Expected

Suggestion is entered into the text view

# Actual

An out of bounds exception is thrown in substringWithRange:

# Configuration

Observed on the two MacBook Pros (with touch bar) available for testing one on 10.12.3 and 10.12.2
