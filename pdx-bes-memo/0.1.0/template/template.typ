#import "@local/pdx-bes-memo:0.1.0": bes-memo
#show: rest => bes-memo(
  sender: "Jason Law",
  recipient: "Vera Katz",
  date: datetime.today().display(),
  re: "Typst Memo",
  rest
)

This is a Typst template for a City of Portland Bureau of Environmental Services
memo. The template is based on the standard BES Microsoft Word memo template.

lorem(25)