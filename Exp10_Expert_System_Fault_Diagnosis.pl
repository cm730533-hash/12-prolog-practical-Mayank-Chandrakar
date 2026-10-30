% Experiment 10: Rule-based Expert System for Fault Diagnosis
% Example queries:
% ?- diagnose(car_wont_start, Cause).
% ?- diagnose(engine_overheating, Cause).
% ?- diagnose(brake_problem, Cause).

symptom(car_wont_start, battery_clicking).
symptom(car_wont_start, dashboard_lights_dim).
symptom(engine_overheating, temperature_gauge_high).
symptom(engine_overheating, coolant_low).
symptom(brake_problem, brake_pedal_soft).
symptom(brake_problem, brake_fluid_low).

diagnosis(battery_clicking, weak_or_dead_battery).
diagnosis(dashboard_lights_dim, weak_or_dead_battery).
diagnosis(temperature_gauge_high, cooling_system_problem).
diagnosis(coolant_low, cooling_system_leak_or_low_coolant).
diagnosis(brake_pedal_soft, possible_brake_hydraulic_problem).
diagnosis(brake_fluid_low, low_brake_fluid_possible_leak).

diagnose(Problem, Cause) :-
    symptom(Problem, Symptom),
    diagnosis(Symptom, Cause).
