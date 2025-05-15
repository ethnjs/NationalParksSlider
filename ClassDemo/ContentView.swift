//
//  ContentView.swift
//  ClassDemo
//
//  Created by Student on 4/25/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    static let JoshuaTree = Card(name: "Joshua Tree National Park", image: "joshua tree", description: "The \"tree of Joshua\" scientifically known as Yucca brevifolia, is a large, slow-growing yucca native to the Mojave Desert. It's often mistaken for a tree but is actually a succulent. The Joshua tree is named after the biblical figure Joshua by 19th-century Mormon settlers, who believed its outstretched branches resembled Joshua guiding the Israelites.", activities: ["figure.hiking", "binoculars.fill", "figure.climbing", "moon.stars.fill"], latCoordinate: 33.881866, longCoordinate: -115.900650, backgroundColor: 0x87583d)
    
    static let Yosemite = Card(name: "Yosemite National Park", image: "yosemite", description: "A renowned natural wonder in California, known for its massive granite cliffs, towering waterfalls, and ancient giant sequoia trees. The park's nearly 1,200 square miles of mountainous scenery includes deep valleys, lush meadows, and a vast wilderness area. It is a popular destination for hiking, rock climbing, and enjoying the diverse natural beauty. ", activities: ["figure.hiking", "bicycle", "binoculars.fill", "figure.climbing"], latCoordinate: 37.865101, longCoordinate: -119.538330, backgroundColor: 0x305066)
    
    static let Zion = Card(name: "Zion National Park", image: "zion", description: "Located in southwestern Utah, Zion National Park is renowned for its dramatic red-rock canyons, towering sandstone cliffs, and diverse landscapes. The park's most prominent feature is Zion Canyon, a 15-mile-long, deeply carved valley, and includes mountains, buttes, mesas, slot canyons, and natural arches. ", activities: ["figure.hiking", "backpack.fill", "figure.climbing", "bicycle"], latCoordinate: 37.297817, longCoordinate: -113.028770, backgroundColor: 0x555452)
    
    static let Yellowstone = Card(name: "Yellowstone National Park", image: "yellowstone", description: "The world's first national park, located in Wyoming, Montana, and Idaho. Yellowstone is famous for its geothermal features, including geysers like Old Faithful and hot springs, as well as its diverse wildlife such as bison, elk, and wolves.", activities: ["figure.hiking", "camera.fill", "binoculars.fill", "pawprint.fill"], latCoordinate: 44.4280, longCoordinate: -110.5885, backgroundColor: 0x3a312c)

    static let GrandCanyon = Card(name: "Grand Canyon National Park", image: "grand canyon", description: "An iconic natural wonder carved by the Colorado River in Arizona. The immense canyon boasts layers of colorful rock revealing millions of years of geological history. Visitors can enjoy breathtaking views, hiking trails, and mule rides into the canyon.", activities: ["figure.hiking", "camera.fill", "binoculars.fill", "mappin.and.ellipse"], latCoordinate: 36.1070, longCoordinate: -112.1130, backgroundColor: 0x714d4d)

    static let RockyMountain = Card(name: "Rocky Mountain National Park", image: "rocky mountains", description: "Located in Colorado, this park features dramatic mountain landscapes, alpine lakes, and diverse wildlife. Trail Ridge Road, the highest continuous paved road in North America, offers stunning panoramic views. Popular activities include hiking, wildlife viewing, and scenic drives.", activities: ["figure.hiking", "camera.fill", "tree.fill", "mountain.2.fill"], latCoordinate: 40.3428, longCoordinate: -105.6836, backgroundColor: 0x2d371e)

    static let Glacier = Card(name: "Glacier National Park", image: "glacier", description: "Situated in Montana along the Canadian border, Glacier National Park is known for its rugged mountains, pristine lakes, and numerous glaciers. The Going-to-the-Sun Road is a spectacular scenic drive. Hiking, backpacking, and wildlife spotting are popular activities.", activities: ["figure.hiking", "tent.fill", "camera.fill", "snowflake"], latCoordinate: 48.7500, longCoordinate: -113.8000, backgroundColor: 0x2c5468)

    static let Acadia = Card(name: "Acadia National Park", image: "acadia", description: "Located along the coast of Maine, Acadia offers a unique blend of rocky coastline, granite peaks, and lush forests. Visitors can enjoy scenic drives along Park Loop Road, hiking trails with ocean views, and charming coastal towns nearby.", activities: ["figure.hiking", "bicycle", "camera.fill", "sailboat.fill"], latCoordinate: 44.3386, longCoordinate: -68.2733, backgroundColor: 0x603622)

    static let GrandTeton = Card(name: "Grand Teton National Park", image: "grand teton", description: "Located in Wyoming, just south of Yellowstone, Grand Teton National Park is characterized by its majestic Teton mountain range, pristine lakes, and abundant wildlife. Popular activities include hiking, climbing, boating, and wildlife viewing.", activities: ["figure.hiking", "figure.climbing", "camera.fill", "water.waves.fill"], latCoordinate: 43.7900, longCoordinate: -110.6800, backgroundColor: 0x918175)

    static let GreatSmokyMountains = Card(name: "Great Smoky Mountains National Park", image: "smoky mountains", description: "Straddling the border between North Carolina and Tennessee, this park is known for its misty mountains, diverse plant and animal life, and rich Appalachian history. It's one of the most visited national parks, offering hiking, scenic drives, and historic sites.", activities: ["figure.hiking", "car.fill", "tree.fill", "house.fill"], latCoordinate: 35.6301, longCoordinate: -83.5080, backgroundColor: 0x3e424d)
    
    let cardArray : [Card] = [JoshuaTree, Yosemite, Zion, GrandCanyon, RockyMountain, Glacier, Acadia, GrandTeton, GreatSmokyMountains]
    
    @State private var currentColor : Int = 0xFFFFFF
    @State private var activeCardIndex: Int? = nil
    
    var body: some View {
        ZStack {
            Color(hex: currentColor)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: currentColor)
            ScrollView (.horizontal) {
                HStack (spacing: 25) {
                    ForEach(cardArray.indices, id: \.self) { index in
                        let card = cardArray[index]
                        
                        // Using GeometryReader to track position of each card
                        GeometryReader { geometry in
                            VStack(alignment: .leading, spacing: 10) {
                                Image(card.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 330, height: 200)
                                    .clipped()
                                    .cornerRadius(10)
                                    
                                Text(card.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                                        
                                Text(card.description)
                                                        
                                MapView(latitude: card.latCoordinate, longitude: card.longCoordinate)
                                    .frame(height: 100)
                                    .cornerRadius(5)
                                                        
                                HStack {
                                    Spacer()
                                    ForEach(card.activities, id: \.self) { activity in
                                        Image(systemName: activity)
                                    }
                                }
                                .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .background(Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(radius: 15))
                            .padding()
                            .scrollTransition { content, phase in
                                content
                                .opacity(phase.isIdentity ? 1 : 0.5)
                                .scaleEffect(y: phase.isIdentity ? 1 : 0.7)
                            }
                            .onAppear {
                                // Track the index of the card as it appears on screen
                                if activeCardIndex == nil || activeCardIndex != index {
                                    activeCardIndex = index
                                    // Update the background color of the card
                                    currentColor = card.backgroundColor
                                }
                            }
                            .onChange(of: activeCardIndex) { _ in
                                // Update background color when the active card changes
                                currentColor = card.backgroundColor
                            }
                            // Use GeometryReader to detect how close this card is to the center of the screen
                            .onChange(of: geometry.frame(in: .global).midX) { newMidX in
                                let screenWidth = UIScreen.main.bounds.width
                                let distanceFromCenter = abs(screenWidth / 2 - newMidX)

                                // If the card is near the center, change the background color
                                if distanceFromCenter < 150 {  // Adjust threshold for proximity
                                    activeCardIndex = index
                                    currentColor = card.backgroundColor
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 40)
                    }
                    Spacer()
                }
                .scrollTargetLayout()
                
            }
            .contentMargins(5, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    ContentView()
}

struct Card {
    var name : String
    var image : String
    var description : String
    var activities : [String]
    var latCoordinate : Double
    var longCoordinate : Double
    var backgroundColor : Int
}

struct MapView: UIViewRepresentable {
    let latitude: Double
    let longitude: Double
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        view.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
