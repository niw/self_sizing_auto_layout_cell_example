Self-sizing auto-layout cell difficulties
=========================================

This is an example application that describes how using self-sizing auto-lahyout cell is difficult.

It is very unclear and not documented at all in any Apple's documentation or header files, looks like `UITableViewCell` caches cell size if it is self-sizing auto-layout cell. After `UITableView` calls `prepareForReuse`, but the cell height remains the previous value and it ends up with broken layout due to unexpected cell size that breaks auto-layout constraints.

In this example, you can see the broken cells, wrong height or some other unexpected visual issues when scrolling the table view at the end and rotating screen and/or rotating screen back.

This is really annoying and because of this, it's mostly impossible to use self-sizing auto-layout cell in the real application implementations.

