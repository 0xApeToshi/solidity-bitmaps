# Example script
def create_bitmaps(flags, size, chunk):
  """
  @param flags The right indexes of 1s
  @param size The size of the bitmap (multiple of 256)
  @param chunk The size of sub-bitmaps (256)
  """
  bitmap = ['0']*size
  for f in flags:
    bitmap[size-f-1] = '1'
    chunks = []
    for i in range(int(size/chunk)):
      chunks.append(int("".join(bitmap[chunk*i:chunk*(i+1)]), 2))
    return chunks
