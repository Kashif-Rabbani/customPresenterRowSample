//
//  Utils.swift
//  Learn
//
//  Created by Kashif Rabbani on 22/02/2020.
//  Copyright © 2020 Kashif Rabbani. All rights reserved.
//

import Foundation

public class Utils {
    
    static let serverURL = "http://130.226.98.179/islamoneDbs/"
    
    struct Translation {
        var name: String
        var author: String
        var column: String
        var englishTranslation: Bool
    }
    
    struct Commentry {
        var name: String
        var nameUrdu: String
        var author: String
        var table: String
        var surahIntroTable: String
        var hasSimpleTranslation: Bool
        var englishTafseer: Bool
    }
    
    
    
    func getTranslations()-> Array<Translation>{
        // Preparing translation items
        let MAUDUDI = Translation(name: "Syed Abul Ala Maududi", author: "مولانا سید ابوالاعلی مودودی", column: "maududi", englishTranslation: false)
        let JALANDHARI = Translation(name: "Fateh Muhammad Jalandhari", author: "مولانا فتح محمد جالندہری", column: "jalandhary", englishTranslation: false)
        let JUNAGARHI = Translation(name: "Muhammad Junagarhi", author: "مولانا محمد جوناگڑہی", column: "junagarhi", englishTranslation: false)
        let TAQI = Translation(name: "Muhammad Taqi Usmani", author: "مفتی محمد تقی عثمانی", column: "taqi", englishTranslation: false)
        let AHMADRAZA = Translation(name: "Ahmad Raza Khan", author: "امام احمد رضا خان", column: "ahmadraza", englishTranslation: false)
        let TAHIRULQADRI = Translation(name: "Tahir ul Qadri", author: "علامہ طاہر القادری", column: "tahirulqadri", englishTranslation: false)
        let ABDUSSALAM = Translation(name: "Abdus Salam Bhutvi", author: "مولانا عبد السلام بھٹوی", column: "abdussalam", englishTranslation: false)
        let KILANI = Translation(name: "Abdur Rahman Kilani", author: "مولانا عبد الرحمٰن کیلانی", column: "kilani", englishTranslation: false)
        let ISLAHI = Translation(name: "Amin Ahsan Islahi", author: "مولانا امین احسن اصلاحی", column: "islahi", englishTranslation: false)
        let ISHAQ = Translation(name: "Ishaq Madani", author: "مولانا اسحاق مدنی", column: "ishaq", englishTranslation: false)
        let MAJID = Translation(name: "Abdul Majid Daryabadi", author: "مولانا عبد الماجد دریابادی", column: "majid", englishTranslation: false)
        let ISRAR = Translation(name: "Dr. Israr Ahmed", author: "ڈاکٹر اسرار احمد", column: "israr", englishTranslation: false)
        let RIFFAT = Translation(name: "Riffat Aijaz", author: "محترمہ رفعت اعجاز", column: "riffat", englishTranslation: false)
        let TRANSLITERATION = Translation(name: "Transliteration", author: "Transliteration (English)", column: "transliteration", englishTranslation: true)
        let MAUDUDI_EN = Translation(name: "Syed Abul Ala Maududi", author: "Syed Abul Ala Maududi", column: "maududien", englishTranslation: true)
        let TAQI_EN = Translation(name: "Muhammad Taqi Usmani", author: "Muhammad Taqi Usmani", column: "taqienglish", englishTranslation: true)
        let MUBARAKPURI = Translation(name: "Safi-ur-Rahman al-Mubarakpuri", author: "Safi-ur-Rahman al-Mubarakpuri", column: "mubarakpuri", englishTranslation: true)
        let PICKTHALL = Translation(name: "Muhammed William Pickthall", author: "Muhammed William Pickthall", column: "pickthall", englishTranslation: true)
        let SAHIHINT = Translation(name: "Saheeh International", author: "Saheeh International", column: "saheehinternational", englishTranslation: true)
        let SARWAR = Translation(name: "Muhammad Sarwar", author: "Muhammad Sarwar", column: "sarwar", englishTranslation: true)
        let SHAKIR = Translation(name: "Muhammad Habib Shakir", author: "Muhammad Habib Shakir", column: "shakir", englishTranslation: true)
        let DARYABADI = Translation(name: "Abdul Majid Daryabadi", author: "Abdul Majid Daryabadi", column: "daryabadi", englishTranslation: true)
        let YUSUF_ALI = Translation(name: "Abdullah Yusuf Ali", author: "Abdullah Yusuf Ali", column: "yousufali", englishTranslation: true)
        
        // Init an empty array for translations
        var translationsArray = [Translation]()
        
        // Add translations into the array
        translationsArray += [MAUDUDI,JALANDHARI,JUNAGARHI,TAQI,AHMADRAZA,TAHIRULQADRI,ABDUSSALAM,KILANI,ISLAHI,ISHAQ,MAJID,ISRAR,RIFFAT,
                              MAUDUDI_EN,TAQI_EN,MUBARAKPURI,PICKTHALL,SAHIHINT,SARWAR,SHAKIR,DARYABADI,YUSUF_ALI, TRANSLITERATION]
        return translationsArray
    }
    
    func getCommentries()-> Array<Commentry>{
        let IBNEKASEER = Commentry(name: "Tafseer Ibn-e-Kaseer", nameUrdu: "تفسیر ابنِ کثیر", author: "اردو ترجمہ: مولانا محمد جوناگڑہی", table: "ibnekaseer", surahIntroTable: "", hasSimpleTranslation: false, englishTafseer: false)
        let TAFHEEM_UL_QURAN = Commentry(name: "Tafheem ul Quran", nameUrdu: "تفہیم القرآن", author: "سید ابو الاعلیٰ مودودی", table: "tafheemulquran", surahIntroTable: "tafheemulquranintro", hasSimpleTranslation: true, englishTafseer: false)
        let MAARIF_UL_QURAN = Commentry(name: "Maarif ul Quran", nameUrdu: "معارف القرآن", author: "مفتی محمد شفیع", table: "maarifulquran", surahIntroTable: "", hasSimpleTranslation: false, englishTafseer: false)
        let TADABBURE_QURAN = Commentry(name: "Tadabbur-e-Quran", nameUrdu: "تدبر قرآن", author: "مولانا امین احسن اصلاحی", table: "tadabburequran", surahIntroTable: "tadabburequranintro", hasSimpleTranslation: false, englishTafseer: false)
        let AASAN_QURAN = Commentry(name: "Aasan Quran", nameUrdu: "آسان قرآن", author: "مفتی محمد تقی عثمانی", table: "aasanquran", surahIntroTable: "aasanquranintro", hasSimpleTranslation: true, englishTafseer: false)
        let AHSANULBAYAN = Commentry(name: "Ahsan ul Bayan", nameUrdu: "احسن البیان", author: "مولانا صلاح الدین یوسف", table: "ahsanulbayan", surahIntroTable: "", hasSimpleTranslation: true, englishTafseer: false)
        let IBNE_ABBAS = Commentry(name: "Tafseer Ibn-e-Abbas", nameUrdu: "تفسیر ابن عباس", author: "مترجم: حافظ محمد سعید احمد عاطف", table: "ibneabbas", surahIntroTable: "", hasSimpleTranslation: false, englishTafseer: false)
        let BAYAN_UL_QURAN = Commentry(name: "Bayan ul Quran", nameUrdu: "بیان القرآن", author: "ڈاکٹر اسرار احمد", table: "bayanulquran", surahIntroTable: "bayanulquranintro", hasSimpleTranslation: false, englishTafseer: false)
        let TAFSEER_AL_QURAN_AL_KAREEM = Commentry(name: "Tafseer Al-Quran", nameUrdu: "تفسیر القرآن الکریم", author: "حافظ عبدالسلام بھٹوی", table: "tafseeralquran", surahIntroTable: "", hasSimpleTranslation: false, englishTafseer: false)
        let TAFHEEM_ENGLISH = Commentry(name: "Tafheem ul Quran English", nameUrdu: "تفہیم القرآن انگلش", author: "سید ابو الاعلیٰ مودودی", table: "tafheemenglish", surahIntroTable: "tafheemenglishintro", hasSimpleTranslation: true, englishTafseer: true)
        let MAARIF_UL_QURAN_ENGLISH = Commentry(name: "Maarif ul Quran English", nameUrdu: "معارف القرآن انگلش", author: "مفتی محمد شفیع", table: "maarifulquranenglish", surahIntroTable: "", hasSimpleTranslation: false, englishTafseer: true)
        
        var commentriesArray = [Commentry]()
        commentriesArray += [IBNEKASEER,TAFHEEM_UL_QURAN,MAARIF_UL_QURAN,TADABBURE_QURAN,AASAN_QURAN,AHSANULBAYAN,IBNE_ABBAS,BAYAN_UL_QURAN,TAFSEER_AL_QURAN_AL_KAREEM,
                             TAFHEEM_ENGLISH,MAARIF_UL_QURAN_ENGLISH]
        return commentriesArray
    }
    
//    // No more in use
//    struct HadithBook {
//        var bookId: Int
//        var name: String
//        var nameUrdu: String
//        var author: String
//        var table: String
//        var chaptersTable: String
//        var skipChapters:Bool
//        var hasEnglishTranslation:Bool
//        var hadithCount: Int
//    }
    
    
    struct Hadith {
        let BUKHARI = HadithResource(bookId: 0, name: "Sahih Bukhari", nameUrdu: "صحیح بخاری", author: "مولانا محمد داؤد راز رحمہ اللہ", table: "bukhari", chaptersTable: "bukharichapters", skipChapters: false, hasEnglishTranslation: true, hadithCount: 7563, previewURL: URL(string: serverURL + "hadith/bukhari.sqlite3")!)
        
        
        let MUSLIM = HadithResource(bookId: 1, name: "Sahih Muslim", nameUrdu: "صحیح مسلم", author: "مولانا عزیزالرحمن", table: "muslim", chaptersTable: "muslimchapters", skipChapters: false, hasEnglishTranslation: true, hadithCount: 7563, previewURL: URL(string: serverURL + "hadith/muslim.sqlite3")!)
        
        
        let ABUDAWOOD = HadithResource(bookId: 2, name: "Abu Dawood", nameUrdu: "سنن ابوداؤد", author: "ڈاکٹر عبدالرحمن بن عبدالجبار الفریوائی", table: "abudawood", chaptersTable: "abudawoodchapters", skipChapters: false, hasEnglishTranslation: true, hadithCount: 5274, previewURL: URL(string: serverURL + "hadith/abudawood.sqlite3")!)
        
        
        let NASAI = HadithResource(bookId: 3, name: "Sunan Nasai", nameUrdu: "سنن نسائی", author: "ڈاکٹر عبدالرحمن بن عبدالجبار الفریوائی", table: "nasai", chaptersTable: "nasaichapters", skipChapters: false, hasEnglishTranslation: true, hadithCount: 5761, previewURL: URL(string: serverURL + "hadith/nasai.sqlite3")!)
        
        
        let TIRMIDHI = HadithResource(bookId: 4, name: "Jame' Tirmidhi", nameUrdu: "جامع ترمذی", author: "ڈاکٹر عبدالرحمن بن عبدالجبار الفریوائی", table: "tirmidhi", chaptersTable: "tirmidhichapters", skipChapters: false, hasEnglishTranslation: true, hadithCount: 3956, previewURL: URL(string: serverURL + "hadith/tirmidhi.sqlite3")!)
        
        
        let IBNEMAAJA = HadithResource(bookId: 5, name: "Ibn-e-Majah", nameUrdu: "سنن ابن ماجہ", author: "ڈاکٹر عبدالرحمن بن عبدالجبار الفریوائی", table: "ibnemaaja", chaptersTable: "ibnemaajachapters", skipChapters: false, hasEnglishTranslation: true, hadithCount: 4341, previewURL: URL(string: serverURL + "hadith/ibnemaaja.sqlite3")!)
        
        
        let MISHKAAT = HadithResource(bookId: 6, name: "Mishkaat", nameUrdu: "مشکوٰۃ المصابیح", author: "قطب الدین خان دہلوی", table: "mishkaat", chaptersTable: "mishkaatchapters", skipChapters: false, hasEnglishTranslation: false, hadithCount: 6333, previewURL: URL(string: serverURL + "hadith/mishkaat.sqlite3")!)
        
        
        let MOTAH = HadithResource(bookId: 7, name: "Muawtta", nameUrdu: "موطا امام مالک", author: "علامہ وحیدالزمان صاحب", table: "motahimammalik", chaptersTable: "motahimammalikchapters", skipChapters: false, hasEnglishTranslation: true, hadithCount: 1740, previewURL: URL(string: serverURL + "hadith/motahimammalik.sqlite3")!)
        
        
        let MUSNADAHMAD = HadithResource(bookId: 8, name: "Musnad Ahmad", nameUrdu: "مسند احمد", author: "مولانا ظفراقبال صاحب", table: "musnadahmad", chaptersTable: "musnadahmadchapters", skipChapters: true, hasEnglishTranslation: false, hadithCount: 26407, previewURL: URL(string: serverURL + "hadith/musnadahmad.sqlite3")!)
        
        
        let SHAMAIL = HadithResource(bookId: 9, name: "Shamail Tirmidhi", nameUrdu: "شمائل ترمذی", author: "مولانا محمدزکریا کاندھلوی صاحب", table: "shamail", chaptersTable: "shamailchapters", skipChapters: true, hasEnglishTranslation: true, hadithCount: 390, previewURL: URL(string: serverURL + "hadith/shamail.sqlite3")!)
        
        
        let MAARIF = HadithResource(bookId: 10, name: "Maarif ul Hadith", nameUrdu: "معارف الحدیث", author: "مولانا محمد منظور نعمانی", table: "maarifulhadith", chaptersTable: "maarifulhadithchapters", skipChapters: false, hasEnglishTranslation: false, hadithCount: 2115, previewURL: URL(string: serverURL + "hadith/maarifulhadith.sqlite3")!)
        
        
    }
    
    
    func getAllHadith()-> Array<HadithResource>{
        let hadithReflector = Hadith()
        let hidthMirror = Mirror(reflecting: hadithReflector)
        var hadithArray = [HadithResource]()
        for child in hidthMirror.children  {
            hadithArray.append(child.value as! HadithResource)
            //print("key: \(String(describing: child.label)), value: \(child.value)")
        }
        return hadithArray
    }
    
    func getHadithDictionary()->Dictionary<String, HadithResource>{
        var hadithDict = Dictionary<String, HadithResource>()
        let hadithReflector = Hadith()
        let hidthMirror = Mirror(reflecting: hadithReflector)
        
        for child in hidthMirror.children  {
            hadithDict[child.label!] = child.value as? HadithResource
        }
        return hadithDict
    }
    
}
