//
//  CalendarView.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 18/02/2025.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date
    @State private var currentMonth: Date

    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
        self._currentMonth = State(initialValue: Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: selectedDate.wrappedValue)) ?? Date())
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Month and Year Header
            HStack(spacing: 4) {
                Text(monthYearFormatter.string(from: currentMonth))
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                    .frame(width: 150, alignment: .leading)

                Button {
                    changeMonth(by: 1)
                } label: {
                    Image(IconsConstants.AIEngineConstantsIcons.arrowNextIC)
                        .resizable()
                        .frame(width: 5, height: 15)
                }

                Spacer()

                Button {
                    changeMonth(by: -1)
                } label: {
                    Image(IconsConstants.AIEngineConstantsIcons.arrowBackIC)
                        .resizable()
                        .frame(width: 15, height: 24)
                }.padding(.trailing, 24)

                Button {
                    changeMonth(by: 1)
                } label: {
                    Image(IconsConstants.AIEngineConstantsIcons.arrowNextIC)
                        .resizable()
                        .frame(width: 15, height: 24)
                }
            }
            .padding(.bottom, 10)

            // Days of the Week
            HStack {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .font(.system(size: 13, weight: .semibold, design: .default))
                        .foregroundColor(.themeColors.darkGrey)
                        .frame(maxWidth: .infinity)
                }
            }

            // Days Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(daysInMonth(for: currentMonth), id: \.self) { date in
                    let isPastDate = date < Calendar.current.startOfDay(for: Date())

                    if Calendar.current.isDate(date, equalTo: currentMonth, toGranularity: .month) {
                        Button(action: {
                            if !isPastDate { selectedDate = date }
                        }) {
                            Text(dayFormatter.string(from: date))
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .font(.system(size: Calendar.current.isDate(date, inSameDayAs: selectedDate) ? 24 : 20,
                                              weight: Calendar.current.isDate(date, inSameDayAs: selectedDate) ? .semibold : .regular, design: .default))
                                .background(Calendar.current.isDate(date, inSameDayAs: selectedDate) ? Color.themeColors.lightGreen.opacity(0.3) : Color.clear)
                                .foregroundColor(isPastDate ? .gray : (Calendar.current.isDate(date, inSameDayAs: selectedDate) ? Color.themeColors.lightGreen : .black))
                                .clipShape(Circle())
                        }
                        .disabled(isPastDate) // Disable the button if the date is in the past
                    } else {
                        Text(dayFormatter.string(from: date))
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .foregroundColor(.gray)
                    }
                }
            }
            .frame(height: 300)
        }
        .onAppear {
            currentMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: selectedDate)) ?? Date()
        }
    }

    private func daysInMonth(for date: Date) -> [Date] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startOfMonth))!

        return (0..<range.count + calendar.component(.weekday, from: startOfMonth) - 1).map { day in
            calendar.date(byAdding: .day, value: day, to: startOfWeek)!
        }
    }

    private func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: currentMonth) {
            currentMonth = newMonth
        }
    }

    private var monthYearFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }

    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }
}
