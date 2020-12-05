extension Array {
  subscript(safeIndex index: Int) -> Element? {
    guard (startIndex..<endIndex).contains(index) else { return nil }
    return self[index]
  }
}
