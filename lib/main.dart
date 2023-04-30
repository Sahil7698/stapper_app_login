import 'package:flutter/material.dart';

import 'Globals/globals.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const StepperApp(),
    ),
  );
}

class StepperApp extends StatefulWidget {
  const StepperApp({Key? key}) : super(key: key);
  @override
  State<StepperApp> createState() => _StepperAppState();
}

class _StepperAppState extends State<StepperApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Stepper App",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stepper(
              onStepTapped: (int index) {},
              currentStep: Globals.stepIndex,
              controlsBuilder: (context, conrol) {
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        (Globals.stepIndex <= 2)
                            ? (Globals.formKey[Globals.stepIndex].currentState!
                                    .validate())
                                ? (Globals.stepIndex < 2)
                                    ? setState(() => Globals.stepIndex++)
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.green,
                                          behavior: SnackBarBehavior.floating,
                                          content: Text("All Detail Saved."),
                                        ),
                                      )
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text("Enter Value"),
                                    ),
                                  )
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  content:
                                      Text("You've reached the Last step."),
                                ),
                              );
                      },
                      child: const Text("Next"),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {
                        (Globals.stepIndex > 0)
                            ? setState(() => Globals.stepIndex--)
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text("Enter Value"),
                                ),
                              );
                      },
                      child: const Text("Back"),
                    ),
                  ],
                );
              },
              steps: [
                Step(
                  state: Globals.stepIndex <= 0
                      ? StepState.editing
                      : StepState.complete,
                  isActive: Globals.stepIndex >= 0,
                  title: const Text("Sign Up"),
                  content: Form(
                    key: Globals.formKey[0],
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Full Name";
                            } else {
                              null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Enter Full Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Email id";
                            } else {
                              null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Enter Email id",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Password";
                            } else {
                              null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Enter Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Confirm Password";
                            } else {
                              null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Enter Confirm Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  state: Globals.stepIndex <= 1
                      ? StepState.editing
                      : StepState.complete,
                  isActive: Globals.stepIndex >= 1,
                  title: const Text("Log In"),
                  content: Form(
                    key: Globals.formKey[1],
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Username";
                            } else {
                              null;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Username",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Password";
                            } else {
                              null;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  state: StepState.complete,
                  isActive: Globals.stepIndex >= 2,
                  title: const Text("Home"),
                  content: Form(
                    key: Globals.formKey[2],
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Contact Number";
                            } else {
                              null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Enter Contact Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
