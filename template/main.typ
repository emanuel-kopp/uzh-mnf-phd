#import "@local/uzh-mnf-phd:0.1.0": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: main_doc.with(
  title: "The Title of Your Thesis", // Rules for Capitalization in Titles: 
                                    // - Capitalize nouns, pronouns, verbs (including conjugated forms of to be), adjectives, and adverbs.
                                    // - Lowercase definite and indefinite articles (a, an, the).
                                    // - Lowercase all prepositions when used strictly as prepositions.
                                    // - Capitalize prepositions when used as adverbs or adjectives: Straighten Up and Fly Right.
                                    // - Lowercase usage of “to” in all situations – whether as a preposition or as part of an infinitive.
                                    // - Capitalize the second part of a hyphenated compound: Research-Based Teaching and Learning.

  author: "Name Surname",           //  (State your first name(s) in the form you prefer; at least one first name must be written out in full. 
                                    // This information will be used for the doctorate diploma.)
  heimatort: "Place of Origin",     // Non-Swiss: Nationality [e.g. aus Frankreich, aus der V.R. China]
                                    // Swiss: place of citizenship and canton [e.g. von Uster ZH]
  land: "Schweiz",                  // Set to "Schweiz" by default, change for non-swiss citizens
  examinators: (                    // (list other members with their academic titles, first name(s) written out in full, 
    "Prof. Dr. Head of Commit",     // Head of committe
    "Dr. First P. Inv",             // Your PI (if not same person as head of committee)
    "Prof. Dr. Other Memebr",
    "Prof. Dr. Last Menber",
  ),
  PI_is_head: true,                 // Define if your head of committee is also your first PI
  date: "2025"                      // Year of submission
)

// Include the separate files here

#include "chapters/summary_eng.typ"

#include "chapters/general_intro.typ"

#include "chapters/chapter_1.typ" 

#include "chapters/chapter_2.typ"

#bibliography("library.bib", style: "apa")
