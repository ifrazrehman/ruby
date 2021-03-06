require_relative '../../spec_helper'

describe "Encoding::UndefinedConversionError#source_encoding" do
  it "returns the source encoding" do
    ec = Encoding::Converter.new("ISO-8859-1", "EUC-JP")
    begin
      ec.convert("\xa0")
    rescue Encoding::UndefinedConversionError => e
      e.source_encoding.should == Encoding::UTF_8
    end
  end
end

describe "Encoding::InvalidByteSequenceError#source_encoding" do
  it "returns the source encoding" do
    ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
    begin
      ec.convert("\xa0")
    rescue Encoding::InvalidByteSequenceError => e
      e.source_encoding.should == Encoding::EUC_JP
    end
  end
end
