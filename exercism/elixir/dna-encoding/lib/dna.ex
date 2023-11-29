defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna), do: do_encode(dna, <<0::size(0)>>)

  defp do_encode([], result), do: result
  defp do_encode([h|t], result) do
    do_encode(t, <<result::bitstring, encode_nucleotide(h)::size(4)>>)
  end

  def decode(dna), do: do_decode(dna, '')

  defp do_decode(<<0::0>>, accum), do: accum
  defp do_decode(<<head::4, rest::bitstring>>, accum) do
    do_decode(rest, accum ++ [decode_nucleotide(head)])
  end
end
