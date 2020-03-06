# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'uri'
require 'faker'

Picture.destroy_all
Review.destroy_all
Rental.destroy_all
Item.destroy_all
User.destroy_all

CAMERA = [ "Aigo", "Advert Tech", "Foscam", "Phase One", "Thomson", "AgfaPhoto", "Leica", "Medion", "Minox", "Praktica", "Rollei", "Tevion", "Traveler", "Vageeswari", "Canon", "Casio", "Epson", "Fujifilm", "Nikon", "Olympus", "Ricoh", "Panasonic", "Pentax", "Sigma", "Sony", "Samsung", "Hasselblad", "Memoto", "BenQ", "Genius", "Bell & Howell", "GE", "GoPro", "HP", "Kodak", "Lytro", "Polaroid", "Vivitar"]
EQUIP = [ "Actinograph", "Air-gap flash", "Photo album", "Anti-halation backing", "Autofocus", "Autographic film", "", "Ball head", "Beauty dish", "BeetleCam", "Bellieni", "Berlebach", "Billingham Bags", "Bulb (photography)", "", "C-stand", "Camera", "Camera monitor", "Camera pedestal", "Camera stabilizer", "Cellulose acetate film", "Changing bag", "Color chart", "Color head", "Color print film", "ColorChecker", "Copy stand", "", "Dark slide (photography)", "Darkroom", "Depssi", "Developing tank", "Dew shield", "Diaphragm (optics)", "Diffuser (optics)", "Digital camera back", "Digital scan back", "Digital versus film photography", "Director's viewfinder", "Dust reduction system", "", "Easel", "Electronic viewfinder", "Enlarger", "Extension tube", "", "Film holder", "Film plane", "Film scanner", "Photographic filter", "Flange focal distance", "Foba", "Focus finder", "Focusing screen", "Four Thirds system", "", "Gigapan", "Gitzo", "Gray card", "Ground glass", "", "Hama (company)", "", "Image processor", "Inkjet technology", "Intervalometer", "", "Jib (camera)", "", "Lee Filters", "Lens adapter", "Lens board", "Lens cover", "Lens hood", "Light meter", "Lightbox", "List of photographic equipment makers", "List of sensors used in digital cameras", "Loupe", "Lowepro", "LumiQuest", "Lyot stop", "", "Mammoth plate", "Manfrotto", "Manual focus override", "Maul Camera Rocket", "Micro Four Thirds system", "Miller Camera Support Equipment", "Mirror cut-off", "Mirror lock-up", "Mole-Richardson", "Monopod", "", "Negative (photography)", "Nikon NASA F4", "", "Onboard camera", "Optical mount", "", "Panaglide", "Pentamirror", "Pentaprism", "Photo booth", "Photo-Me International", "Photographic film", "Photographic paper", "Photographic studio", "Photosensitive glass", "Photographic plate", "Positive (photography)", "Process camera", "Prontor-Compur", "", "R & J Beck", "Reflector (photography)", "Registration pin", "Remote camera", "Réseau plate", "Ricoh GR digital cameras", "Ricoh GR film cameras", "Roll film", "", "Safelight", "Sandwich panel", "Scientific Working Group – Imaging Technology", "Selenium meter", "Selfie stick", "Shutter lag", "Singh-Ray", "History of the single-lens reflex camera", "Slide copier", "Slide viewer", "Slik Corporation", "Snoot", "Softbox", "Hard and soft light", "Sound blimp", "Speed ring", "Stanhope (optical bijou)", "Steadicam", "Stereoplotter", "Stereoscope", "", "Tachistoscope", "Telecompressor", "Thermal copier", "Think Tank Photo", "Through-the-lens metering", "Triggertrap", "Tripod", "Tripod (photography)", "Tripod head", "", "Velbon", "View-Master", "Viewfinder", "", "Waterhouse stop", "Wratten number", "", "Zink (technology)", "Zone plate"]
LENSES = [ "Canon EF 14mm lens", "Canon EF 17-40mm lens", "Canon EF 20mm lens", "Canon EF 20-35mm lens", "Canon EF 24–70mm lens", "Canon EF 24-105mm lens", "Canon EF 200mm lens", "Canon EF 28-80mm lens", "Canon EF 28-90mm lens", "Canon EF 28-105mm lens", "Canon EF 28-200mm lens", "Canon EF 28mm lens", "Canon EF 35mm lens", "Canon EF 38-76mm lens", "Canon EF 40mm lens", "Canon EF 55–200mm lens", "Canon EF 70–200mm lens", "Canon EF 70-300mm lens", "Canon EF 80-200mm lens", "Canon EF 85mm lens", "Canon EF 100mm lens", "Canon EF 100–200mm lens", "Canon EF 100-300mm lens", "Canon EF 180mm f/3.5L Macro USM lens", "Canon EF 200-400mm lens", "Canon EF 500mm lens", "Canon EF 600mm lens", "Canon EF 800mm lens", "", "Canon EF 8-15mm lens", "Canon EF 11–24mm lens", "Canon EF 15mm lens", "Canon EF 16-35mm lens", "Canon EF 17-35mm lens", "Canon EF 22-55mm lens", "Canon EF 24-85mm lens", "Canon EF 24mm lens", "Canon EF 28-70mm lens", "Canon EF 28-135mm lens", "Canon EF 28-300mm lens", "Canon EF 35-70mm lens", "Canon EF 35–80mm lens", "Canon EF 35–105mm lens", "Canon EF 35-135mm lens", "Canon EF 35–350mm lens", "Canon EF 50-200mm lens", "Canon EF 50mm lens", "Canon EF 70–210mm lens", "Canon EF 75–300mm lens", "Canon EF 90–300mm lens", "Canon EF 100-400mm lens", "Canon EF 135mm lens", "Canon EF 300mm lens", "Canon EF 400mm lens", "Canon EF 1200mm lens", "Canon Extender EF", "Canon TS-E 17mm lens", "Canon TS-E 24mm lens", "Canon TS-E 45mm lens", "Canon TS-E 50mm lens", "Canon TS-E 90mm lens", "Canon TS-E 135mm lens", "", "Canon MP-E 65mm f/2.8 1–5x Macro", "", "Canon EF portrait lenses", "Sony E 16mm F2.8", "Sony E 20mm F2.8", "Sony FE 20mm F1.8 G", "Sony Carl Zeiss Sonnar T* E 24mm F1.8 ZA", "Sony FE 24mm F1.4 GM", "Sony FE 28mm F2", "Sony E 30mm F3.5 Macro", "Sony Zeiss Distagon T* FE 35mm F1.4 ZA", "Sony E 35mm F1.8 OSS", "Sony Carl Zeiss Sonnar T* FE 35mm F2.8 ZA", "Sony FE 35mm F1.8", "Sony Zeiss Planar T* FE 50mm F1.4 ZA", "Sony E 50mm F1.8 OSS", "Sony FE 50mm F1.8", "Sony FE 50mm F2.8 Macro", "Sony Carl Zeiss Sonnar T* FE 55mm F1.8 ZA", "Sony FE 85mm F1.4 GM", "Sony FE 85mm F1.8", "Sony FE 90mm F2.8 Macro G OSS", "Sony FE 100mm F2.8 STF GM OSS", "Sony FE 135mm F1.8 GM", "Sony FE 400mm F2.8 GM OSS", "Sony FE 600mm F4.0 GM OSS", "Sony E 10-18mm F4 OSS", "Sony FE 12-24mm F4 G", "Sony FE 16-35mm F2.8 GM", "Sony Zeiss Vario-Tessar T* FE 16-35mm F4 ZA OSS", "Sony FE C 16-35mm T3.1 G", "Sony E PZ 16-50mm F3.5-5.6 OSS", "Sony E 16-55mm F2.8 G", "Sony Carl Zeiss Vario-Tessar T* E 16-70mm F4 ZA OSS", "Sony E 18-50mm F4-5.6", "Sony E 18-55mm F3.5-5.6 OSS", "Sony E PZ 18-105mm F4 G OSS", "Sony E PZ 18-110mm F4 G OSS", "Sony E 18-135mm F3.5-5.6 OSS", "Sony E 18-200mm F3.5-6.3 OSS", "Sony E 18-200mm F3.5-6.3 OSS LE", "Sony E PZ 18-200mm F3.5-6.3 OSS", "Sony Carl Zeiss Vario-Tessar T* FE 24-70mm F4 ZA OSS", "Sony FE 24-70mm F2.8 GM", "Sony FE 24-105mm F4 G OSS", "Sony FE 24-240mm F3.5-6.3 OSS", "Sony FE 28-70mm F3.5-5.6 OSS", "Sony FE PZ 28-135mm F4 G OSS", "Sony E 55-210mm F4.5-6.3 OSS", "Sony FE 70-200mm F4 G OSS", "Sony FE 70-200mm F2.8 GM OSS", "Sony FE 70-300mm F4.5-5.6 G OSS", "Sony E 70-350mm F4.5-6.3 G OSS", "Sony FE 100-400mm F4.5-5.6 GM OSS", "Sony FE 200-600mm F5.6-6.3 G OSS", "Sony Fisheye Converter 0.62x", "Sony Fisheye Converter 0.62x", "Sony Ultra Wide Converter 0.75x", "Sony Ultra Wide Converter 0.75x", "Sony Fisheye Converter 0.57x", "Sony Ultra Wide Converter 0.75x", "Sony Tele Converter 1.4x", "Sony Tele Converter 2x", "Sony Lens Adapter E/A 1", "Sony Lens Adapter E/A 2", "Sony Lens Adapter E/A 4", "Sony Lens Adapter E/A 3", "16mm", "20mm", "20mm", "24mm", "24mm", "28mm", "30mm", "35mm", "35mm", "35mm", "35mm", "50mm", "50mm", "50mm", "50mm", "55mm", "85mm", "85mm", "90mm", "100mm", "135mm", "400mm", "600mm", "10-22mm", "12-24mm", "16-35mm", "16-35mm", "16-35mm", "16-50mm", "16-55mm", "16-70mm", "18-50mm", "18-55mm", "18-105mm", "18-110mm", "18-135mm", "18-200mm", "18-200mm", "18-200mm", "24-70mm", "24-70mm", "24-105mm", "24-240mm", "28-70mm", "28-135mm", "55-210mm", "70-200mm", "70-200mm", "70-300mm", "70-350mm", "100-400mm", "200-600mm" ]

CAMERA_URL = ["https://cdn.mos.cms.futurecdn.net/dzDWYxpsXBvVtNBd8Cuao8.jpg",
              "https://leicarumors.com/wp-content/uploads/2020/01/Leica-M10-Monochrom-camera.jpeg",
              "https://cdn.thewirecutter.com/wp-content/uploads/2018/10/instant-cameras-2018-lowres-8481.jpg",
              "https://cdn.vox-cdn.com/thumbor/h39165LtrklgeJMPX1XLDxSCE60=/0x0:2040x1360/1200x675/filters:focal(854x725:1180x1051)/cdn.vox-cdn.com/uploads/chorus_image/image/65535074/dseifert_20191022_3750_0014.0.jpg",
              "https://static.toiimg.com/thumb/msid-58107467,width-640,resizemode-4/58107467.jpg",
              "https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2019/06/5437eb270f0870deef4007a49ae9d7a9.jpg",
              "https://images.unsplash.com/photo-1533425962554-06f6d8c4dacc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80",
              "https://images.unsplash.com/photo-1494587859747-ecd6dfbd6abe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
              "https://images.pexels.com/photos/67654/pexels-photo-67654.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
              "https://c1.wallpaperflare.com/preview/46/208/944/camera-classic-lens-table-vintage.jpg"
              # "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSYCKKQZNSnrfeThxxx4V7W7xRNSgkaFxrRwKfpEF5VMaWsiaHH",
              # "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSYCKKQZNSnrfeThxxx4V7W7xRNSgkaFxrRwKfpEF5VMaWsiaHH",
              # "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT0F-ZrWGBrXPA2LdBhYaUAcwdh19DWAjs4CNKtN7FqB0ZbK3LR",
              # "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT0F-ZrWGBrXPA2LdBhYaUAcwdh19DWAjs4CNKtN7FqB0ZbK3LR",
              # "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSroycuhZwok-Wl0d2GXNHQWjBB895V4zxaE3hnmAXSTRywNxSZ",
              # "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS0dYCTC24OdZrQdd4VW9TqArtQmVPlsAju06U7OtCROEu6Gsrk",
              # "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcST326GcVh9khkPsNq1txQIsDNjWdV5-iwpDIND2GUAKD7EiH-C",
              # "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWmyI511JYpwEtTJt5EQ4mqmfWOdmFpggaIrwNAap9mS8MXs3"
              ]

LENSES_URL = ["https://www.adorama.com/alc/wp-content/uploads/2016/10/lens_shutterstock_398047129-1024x576.jpg",
              "https://www.pixobo.com/wp-content/uploads/2020/02/How-Does-a-Camera-Lens-Affect-the-Quality-of-a-Photo-Explained-800x450.jpg",
              "https://lh4.googleusercontent.com/proxy/o0hu0QD2BSqJW7KaNwf9KRYIaEVpRqfzDvp4eOQrMcED370Y5izdJD-LvWoJKZUov_CtfeVF6RneAEbiUa9F1fLgKT5AFJ9_cqCJodqzxAIccVw",
              "https://cdn.shopify.com/s/files/1/1415/1308/products/om-nik-pro-04_1400x.jpg?v=1479143990",
              "https://cdn.shoplightspeed.com/shops/602339/files/17138724/rental-kit.jpg",
              "https://res.cloudinary.com/offshoot/image/fetch/q_auto,f_auto/https://static.offshoot.rentals/media/images/items/display/leica_summicron_c_cinema_lens_set_2.png"
             ]

EQUIP_URL = ["https://images.prod.meredith.com/product/6092637ca63b9307b6a26e054ecffc99/1511695824087/l/zakitane-desktop-mini-tripod-universal-3-legs-monopod-base-stand-support-for-dslr-slr-cameras-video-micro-shooting"]


ADDRESSESS = [
  "777 Brockton Avenue, Abington MA 2351",
  "30 Memorial Drive, Avon MA 2322",
  "250 Hartford Avenue, Bellingham MA 2019",
  "700 Oak Street, Brockton MA 2301",
  "66-4 Parkhurst Rd, Chelmsford MA 1824",
  "591 Memorial Dr, Chicopee MA 1020",
  "55 Brooksby Village Way, Danvers MA 1923",
  "137 Teaticket Hwy, East Falmouth MA 2536",
  "42 Fairhaven Commons Way, Fairhaven MA 2719",
  "374 William S Canning Blvd, Fall River MA 2721",
  "121 Worcester Rd, Framingham MA 1701",
  "677 Timpany Blvd, Gardner MA 1440",
  "337 Russell St, Hadley MA 1035",
  "295 Plymouth Street, Halifax MA 2338",
  "1775 Washington St, Hanover MA 2339",
  "280 Washington Street, Hudson MA 1749",
  "20 Soojian Dr, Leicester MA 1524",
  "11 Jungle Road, Leominster MA 1453",
  "301 Massachusetts Ave, Lunenburg MA 1462",
  "780 Lynnway, Lynn MA 1905",
  "70 Pleasant Valley Street, Methuen MA 1844",
  "830 Curran Memorial Hwy, North Adams MA 1247",
  "1470 S Washington St, North Attleboro MA 2760",
  "506 State Road, North Dartmouth MA 2747",
  "742 Main Street, North Oxford MA 1537",
  "72 Main St, North Reading MA 1864",
  "200 Otis Street, Northborough MA 1532",
  "180 North King Street, Northhampton MA 1060",
  "555 East Main St, Orange MA 1364",
  "555 Hubbard Ave-Suite 12, Pittsfield MA 1201",
  "300 Colony Place, Plymouth MA 2360",
  "301 Falls Blvd, Quincy MA 2169",
  "36 Paramount Drive, Raynham MA 2767",
  "450 Highland Ave, Salem MA 1970",
  "1180 Fall River Avenue, Seekonk MA 2771",
  "1105 Boston Road, Springfield MA 1119",
  "100 Charlton Road, Sturbridge MA 1566",
  "262 Swansea Mall Dr, Swansea MA 2777",
  "333 Main Street, Tewksbury MA 1876",
  "550 Providence Hwy, Walpole MA 2081",
  "352 Palmer Road, Ware MA 1082",
  "3005 Cranberry Hwy Rt 6 28, Wareham MA 2538",
  "250 Rt 59, Airmont NY 10901",
  "141 Washington Ave Extension, Albany NY 12205",
  "13858 Rt 31 W, Albion NY 14411",
  "2055 Niagara Falls Blvd, Amherst NY 14228",
  "101 Sanford Farm Shpg Center, Amsterdam NY 12010",
  "297 Grant Avenue, Auburn NY 13021",
  "4133 Veterans Memorial Drive, Batavia NY 14020",
  "6265 Brockport Spencerport Rd, Brockport NY 14420",
  "5399 W Genesse St, Camillus NY 13031",
  "3191 County rd 10, Canandaigua NY 14424",
  "30 Catskill, Catskill NY 12414",
  "161 Centereach Mall, Centereach NY 11720",
  "3018 East Ave, Central Square NY 13036",
  "100 Thruway Plaza, Cheektowaga NY 14225",
  "8064 Brewerton Rd, Cicero NY 13039",
  "5033 Transit Road, Clarence NY 14031",
  "3949 Route 31, Clay NY 13041",
  "139 Merchant Place, Cobleskill NY 12043",
  "85 Crooked Hill Road, Commack NY 11725",
  "872 Route 13, Cortlandville NY 13045",
  "279 Troy Road, East Greenbush NY 12061",
  "2465 Hempstead Turnpike, East Meadow NY 11554",
  "6438 Basile Rowe, East Syracuse NY 13057",
  "25737 US Rt 11, Evans Mills NY 13637",
  "901 Route 110, Farmingdale NY 11735",
  "2400 Route 9, Fishkill NY 12524",
  "10401 Bennett Road, Fredonia NY 14063",
  "1818 State Route 3, Fulton NY 13069",
  "4300 Lakeville Road, Geneseo NY 14454",
  "990 Route 5 20, Geneva NY 14456",
  "311 RT 9W, Glenmont NY 12077",
  "200 Dutch Meadows Ln, Glenville NY 12302",
  "100 Elm Ridge Center Dr, Greece NY 14626",
  "1549 Rt 9, Halfmoon NY 12065",
  "5360 Southwestern Blvd, Hamburg NY 14075",
  "103 North Caroline St, Herkimer NY 13350",
  "1000 State Route 36, Hornell NY 14843",
  "1400 County Rd 64, Horseheads NY 14845",
  "135 Fairgrounds Memorial Pkwy, Ithaca NY 14850",
  "2 Gannett Dr, Johnson City NY 13790",
  "233 5th Ave Ext, Johnstown NY 12095",
  "601 Frank Stottile Blvd, Kingston NY 12401",
  "350 E Fairmount Ave, Lakewood NY 14750",
  "4975 Transit Rd, Lancaster NY 14086",
  "579 Troy-Schenectady Road, Latham NY 12110",
  "5783 So Transit Road, Lockport NY 14094",
  "7155 State Rt 12 S, Lowville NY 13367",
  "425 Route 31, Macedon NY 14502",
  "3222 State Rt 11, Malone NY 12953",
  "200 Sunrise Mall, Massapequa NY 11758",
  "43 Stephenville St, Massena NY 13662",
  "750 Middle Country Road, Middle Island NY 11953",
  "470 Route 211 East, Middletown NY 10940",
  "3133 E Main St, Mohegan Lake NY 10547",
  "288 Larkin, Monroe NY 10950",
  "41 Anawana Lake Road, Monticello NY 12701",
  "4765 Commercial Drive, New Hartford NY 13413",
  "1201 Rt 300, Newburgh NY 12550",
  "255 W Main St, Avon CT 6001",
  "120 Commercial Parkway, Branford CT 6405",
  "1400 Farmington Ave, Bristol CT 6010",
  "161 Berlin Road, Cromwell CT 6416",
  "67 Newton Rd, Danbury CT 6810",
  "656 New Haven Ave, Derby CT 6418",
  "69 Prospect Hill Road, East Windsor CT 6088",
  "150 Gold Star Hwy, Groton CT 6340",
  "900 Boston Post Road, Guilford CT 6437",
  "2300 Dixwell Ave, Hamden CT 6514",
  "495 Flatbush Ave, Hartford CT 6106",
  "180 River Rd, Lisbon CT 6351",
  "420 Buckland Hills Dr, Manchester CT 6040",
  "1365 Boston Post Road, Milford CT 6460",
  "1100 New Haven Road, Naugatuck CT 6770",
  "315 Foxon Blvd, New Haven CT 6513",
  "164 Danbury Rd, New Milford CT 6776",
  "3164 Berlin Turnpike, Newington CT 6111",
  "474 Boston Post Road, North Windham CT 6256",
  "650 Main Ave, Norwalk CT 6851",
  "680 Connecticut Avenue, Norwalk CT 6854",
  "220 Salem Turnpike, Norwich CT 6360",
  "655 Boston Post Rd, Old Saybrook CT 6475",
  "625 School Street, Putnam CT 6260",
  "80 Town Line Rd, Rocky Hill CT 6067",
  "465 Bridgeport Avenue, Shelton CT 6484",
  "235 Queen St, Southington CT 6489",
  "150 Barnum Avenue Cutoff, Stratford CT 6614",
  "970 Torringford Street, Torrington CT 6790",
  "844 No Colony Road, Wallingford CT 6492",
  "910 Wolcott St, Waterbury CT 6705",
  "155 Waterford Parkway No, Waterford CT 6385",
  "515 Sawmill Road, West Haven CT 6516",
  "2473 Hackworth Road, Adamsville AL 35005",
  "630 Coonial Promenade Pkwy, Alabaster AL 35007",
  "2643 Hwy 280 West, Alexander City AL 35010",
  "540 West Bypass, Andalusia AL 36420",
  "5560 Mcclellan Blvd, Anniston AL 36206",
  "1450 No Brindlee Mtn Pkwy, Arab AL 35016",
  "1011 US Hwy 72 East, Athens AL 35611",
  "973 Gilbert Ferry Road Se, Attalla AL 35954",
  "1717 South College Street, Auburn AL 36830",
  "701 Mcmeans Ave, Bay Minette AL 36507",
  "750 Academy Drive, Bessemer AL 35022",
  "312 Palisades Blvd, Birmingham AL 35209",
  "1600 Montclair Rd, Birmingham AL 35210",
  "5919 Trussville Crossings Pkwy, Birmingham AL 35235",
  "9248 Parkway East, Birmingham AL 35206",
  "1972 Hwy 431, Boaz AL 35957",
  "10675 Hwy 5, Brent AL 35034",
  "2041 Douglas Avenue, Brewton AL 36426",
  "5100 Hwy 31, Calera AL 35040",
  "1916 Center Point Rd, Center Point AL 35215",
  "1950 W Main St, Centre AL 35960",
  "16077 Highway 280, Chelsea AL 35043",
  "1415 7Th Street South, Clanton AL 35045",
  "626 Olive Street Sw, Cullman AL 35055",
  "27520 Hwy 98, Daphne AL 36526",
  "2800 Spring Avn SW, Decatur AL 35603",
  "969 Us Hwy 80 West, Demopolis AL 36732",
  "3300 South Oates Street, Dothan AL 36301",
  "4310 Montgomery Hwy, Dothan AL 36303",
  "600 Boll Weevil Circle, Enterprise AL 36330",
  "3176 South Eufaula Avenue, Eufaula AL 36027",
  "7100 Aaron Aronov Drive, Fairfield AL 35064",
  "10040 County Road 48, Fairhope AL 36533",
  "3186 Hwy 171 North, Fayette AL 35555",
  "3100 Hough Rd, Florence AL 35630",
  "2200 South Mckenzie St, Foley AL 36535",
  "2001 Glenn Bldv Sw, Fort Payne AL 35968",
  "340 East Meighan Blvd, Gadsden AL 35903",
  "890 Odum Road, Gardendale AL 35071",
  "1608 W Magnolia Ave, Geneva AL 36340",
  "501 Willow Lane, Greenville AL 36037",
  "170 Fort Morgan Road, Gulf Shores AL 36542",
  "11697 US Hwy 431, Guntersville AL 35976",
  "42417 Hwy 195, Haleyville AL 35565",
  "1706 Military Street South, Hamilton AL 35570",
  "1201 Hwy 31 NW, Hartselle AL 35640",
  "209 Lakeshore Parkway, Homewood AL 35209",
  "2780 John Hawkins Pkwy, Hoover AL 35244",
  "5335 Hwy 280 South, Hoover AL 35242",
  "1007 Red Farmer Drive, Hueytown AL 35023",
  "2900 S Mem PkwyDrake Ave, Huntsville AL 35801",
  "11610 Memorial Pkwy South, Huntsville AL 35803",
  "2200 Sparkman Drive, Huntsville AL 35810",
  "330 Sutton Rd, Huntsville AL 35763",
  "6140A Univ Drive, Huntsville AL 35806",
  "4206 N College Ave, Jackson AL 36545",
  "1625 Pelham South, Jacksonville AL 36265",
  "1801 Hwy 78 East, Jasper AL 35501",
  "8551 Whitfield Ave, Leeds AL 35094",
  "8650 Madison Blvd, Madison AL 35758",
  "145 Kelley Blvd, Millbrook AL 36054",
  "1970 S University Blvd, Mobile AL 36609",
  "6350 Cottage Hill Road, Mobile AL 36609",
  "101 South Beltline Highway, Mobile AL 36606",
  "2500 Dawes Road, Mobile AL 36695",
  "5245 Rangeline Service Rd, Mobile AL 36619",
  "685 Schillinger Rd, Mobile AL 36695",
  "3371 S Alabama Ave, Monroeville AL 36460",
  "10710 Chantilly Pkwy, Montgomery AL 36117",
  "3801 Eastern Blvd, Montgomery AL 36116",
  "6495 Atlanta Hwy, Montgomery AL 36117",
  "851 Ann St, Montgomery AL 36107",
  "15445 Highway 24, Moulton AL 35650",
  "517 West Avalon Ave, Muscle Shoals AL 35661",
  "5710 Mcfarland Blvd, Northport AL 35476",
  "2453 2Nd Avenue East, Oneonta AL 35121  205-625-647",
  "2900 Pepperrell Pkwy, Opelika AL 36801",
  "92 Plaza Lane, Oxford AL 36203",
  "1537 Hwy 231 South, Ozark AL 36360",
  "2181 Pelham Pkwy, Pelham AL 35124",
  "165 Vaughan Ln, Pell City AL 35125",
  "3700 Hwy 280-431 N, Phenix City AL 36867",
  "1903 Cobbs Ford Rd, Prattville AL 36066",
  "4180 Us Hwy 431, Roanoke AL 36274",
  "13675 Hwy 43, Russellville AL 35653",
  "1095 Industrial Pkwy, Saraland AL 36571",
  "24833 Johnt Reidprkw, Scottsboro AL 35768",
  "1501 Hwy 14 East, Selma AL 36703",
  "7855 Moffett Rd, Semmes AL 36575",
  "150 Springville Station Blvd, Springville AL 35146",
  "690 Hwy 78, Sumiton AL 35148",
  "41301 US Hwy 280, Sylacauga AL 35150",
  "214 Haynes Street, Talladega AL 35160",
  "1300 Gilmer Ave, Tallassee AL 36078",
  "34301 Hwy 43, Thomasville AL 36784",
  "1420 Us 231 South, Troy AL 36081",
  "1501 Skyland Blvd E, Tuscaloosa AL 35405",
  "3501 20th Av, Valley AL 36854",
  "1300 Montgomery Highway, Vestavia Hills AL 35216",
  "4538 Us Hwy 231, Wetumpka AL 36092",
  "2575 Us Hwy 43, Winfield AL 35594"
]

# PASSWORD ALWAYS == 'password'

# create user with rentals
user_with_rentals = User.new(password: 'password', email: 'user1@gmail.com')
user_with_rentals.first_name = 'GuyWhoRents'
user_with_rentals.last_name = 'Jackson'
user_with_rentals.location = 'Canggu'
user_with_rentals.save!
puts "Created #{user_with_rentals}"
user_with_rentals.save!

# create user who rents out his equipment

user_with_items = User.new(password: 'password', email: 'user2@hotmail.com')
user_with_items.first_name = 'GuyWhoOwns'
user_with_items.last_name = 'Smith'
user_with_items.location = 'Sanur'
user_with_items.save!
puts "Created #{user_with_items}"

# create
15.times do
  item = Item.new(user: user_with_items)
  item.available = true
  item.item_category = ["Camera", "Accessory", "Lens"].sample
  case item.item_category
  when "Camera"
    item.model = CAMERA.sample
    picture_url = URI.unescape(CAMERA_URL.sample)
    picture_url = URI.open(picture_url)
    picture_description = 'A camera that has been used a lot, picture taken from the front.'
  when "Lens"
    item.model = LENSES.sample
    picture_url = URI.unescape(LENSES_URL.sample)
    picture_url = URI.open(picture_url)
    picture_description = "I'm not using this lens anymore, still in good condition."
  when "Accessory"
    item.model = EQUIP.sample
    picture_url = URI.unescape(EQUIP_URL.sample)
    picture_url = URI.open(picture_url)
     picture_description = "Some scratches on this tripad, as ypu can see."
  end
  item.price_per_day = (rand * rand(1..100)).round(2)
  item.brand = 'Testinfo Brandname'
  item.product_description = Faker::Vehicle.standard_specs.join('')
  item.user_description = Faker::Books::Lovecraft.sentence
  item.condition = ["Poor", "Sufficient", "Good", "As New"].sample
  item.address = ADDRESSESS.sample
  item.save!

  picture = Picture.new(description: picture_description)
  picture.photo.attach(io: picture_url, filename: 'equipyourreel.jpg', content_type: 'image/jpg')
  picture.item = item
  picture.save!
  puts "Photo uploaded"
end
puts "Creating items"

# create rentals
3.times do
  rental = Rental.new(user: user_with_rentals, item: Item.all.sample)
  rental.start_date = Date.new(2020,2,3)
  rental.end_date = Date.new(2020,4,12)
  rental.total_price = 0
  rental.save!
end
puts "Creating rentals"

# create reviews
review = Review.new(rental: Rental.first)
review.content = "Great product, just awesome"
review.rating = rand(1..5)
review.save!


review = Review.new(rental: Rental.last)
review.content = "Awful, horrible condition, owner was not reachable"
review.rating = rand(1..5)
review.save!

puts "Creating reviews"
