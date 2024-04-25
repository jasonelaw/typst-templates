// This function gets your whole document as its `body`
// and formats it as a simple letter.
#let bes-memo(
  // The letter's sender, which is display at the top of the page.
  sender: none,

  // The letter's recipient, which is displayed close to the top.
  recipient: none,

  // The date, displayed to the right.
  date: none,

  // The subject line.
  re: none,
  
  // The letterhead image file path
  letterhead: "images/letterhead.png",

  // The memo body
  body
) = {

  let footer = [
    #set text(font: "Palatino Linotype", size: 10pt)
    #line(length: 100%, stroke: (thickness: 0.5pt, paint: black))
    #v(4pt, weak: true)
    Ph: 503-823-7740 #sym.square.filled
    Fax: 503-823-6995 #sym.square.filled
    #link("https://portland.gov/bes")[portland.gov/bes] #sym.square.filled
    An Equal Opportunity Employer\

    #set text(font: "Calibri", size: 8pt)
    #v(0.5em)
    The City of Portland ensures meaningful access to City programs, services,
    and activities to comply with Civil Rights Title VI and ADA Title II laws
    and reasonably provides: translation interpretation, modifications,
    accomodations, alternative formats, auxiliary aids and services. To request
    these services or file a complaint of discrimination, contact 503-823-7740,
    or 311 (503-823-4000), for Relay Service and TTY: 711.
  ]
  // Configure page and text properties.
  set page(
    paper: "us-letter",
    margin: (x: 1.5in, y: 1.5in),
    header: context {
      if counter(page).get().first() == 1 {
        align(center + bottom,
          move(block(
            height: 1.5in,
            width: 7.5in,
            image(letterhead, width: 100%)
          ), dy: 0.5in),
        )
      }
    },
    footer-descent: 10%,
    footer: context {
      if counter(page).get().first() == 1 {
        align(center + horizon,
          block(
            height: 1.75in,
            width: 7in,
            footer
          )
        )
      }
    }
  )

/*  align(center,
    move(
      block(
        height: 1in,
        width: 7.5in,
        image(letterhead, width: 100%)
      ),
      dy: 1in
    )
  )
*/
  v(5em)
  text(font: "Calibri", weight: "light", size: 18pt, tracking: 12pt,
    upper("Memorandum")
  )

  // Memo header material
  set text(font: "Calibri", size: 12pt, weight: "bold")
  line(length: 100%)
  date
  grid(
    columns: (1.0in, auto),
    rows: (auto),
    row-gutter: 12pt,
    "To:", recipient,
    "From:", sender,
    "RE:", re
  )
  line(length: 100%)
  v(2em)


  // memo body
  set text(font: "Calibri", size: 12pt, weight: "regular")
  set par(linebreaks: "optimized", first-line-indent: 1em)
  body
}
