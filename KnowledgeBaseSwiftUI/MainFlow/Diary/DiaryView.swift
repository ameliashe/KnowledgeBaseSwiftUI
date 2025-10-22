//
//  DiaryView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 5/3/25.
//

import SwiftUI
import SwiftData
import Charts

struct DiaryView: View {
	@Environment(\.modelContext) private var modelContext
	@Query(sort: \DiaryEntry.date, order: .forward) private var entries: [DiaryEntry]
	@State private var showingEntryView: Bool = false
	@State private var drinks: [Drink] = []
	var titleOn: Bool

	private var lastDays: [Date] {
		(0..<7).compactMap {
			Calendar.current.date(byAdding: .day, value: -$0, to: Date())
		}.reversed()
	}

	private var drinkByTitle: [String: Drink] {
		Dictionary(uniqueKeysWithValues: drinks.map { ($0.title, $0) })
	}

	private var dailyML: [(date: Date, totalML: Int)] {
		lastDays.map { date in
			let total = entries
				.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
				.reduce(0) { sum, entry in
					sum + entry.drinks.reduce(0) { s, drink in
						if let model = drinkByTitle[drink] {
							return s + model.portionML
						}
						return s
					}
				}
			return (date: date, totalML: total)
		}
	}

	var body: some View {
		NavigationStack {
			Form {
				Section {
					Chart {
						ForEach(dailyML, id: \.date) { data in
							BarMark(
								x: .value("Day", data.date, unit: .day),
								y: .value("Sum, ml", data.totalML)
							)
						}
					}
					.chartXAxis {
						AxisMarks(values: .stride(by: .day)) { _ in
							AxisValueLabel(format: .dateTime.weekday(.abbreviated))
						}
					}
					.chartYAxisLabel("ml")
					.frame(height: 150)
				}

				Section {
					List {
						ForEach(lastDays, id: \.self) { date in
							NavigationLink {
								let drinksForDay = entries
									.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
									.flatMap { $0.drinks }
								DiaryEntryDetails(date: date, drinks: drinksForDay)
							} label: {
								HStack {
									Text(date, format: .dateTime.weekday(.abbreviated).day())
										.frame(minWidth: 80, alignment: .leading)
									Spacer()
									let dailyCount = entries
										.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
										.reduce(0) { sum, entry in
											sum + entry.drinks.count
										}

									if dailyCount > 0 {
										Text("\(dailyCount)")
									} else {
										Text("—")
											.foregroundColor(.secondary)
									}
								}
								.padding(.vertical, 4)
							}
						}
					}
				}

			}
			.navigationTitle(titleOn ? "Diary" : "")
			.navigationBarTitleDisplayMode(.large)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: {
						showingEntryView.toggle()
					}) {
						Image(systemName: "plus")
					}
				}
			}
			.sheet(isPresented: $showingEntryView) {
				DiaryEntryView()
			}
		}
		.task {
			drinks = await DrinksLoader.loadDrinks()
		}
	}
}
