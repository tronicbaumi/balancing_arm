# PCB Design Guidelines
## Youtube Videos
[Hans Rosenberg](https://www.youtube.com/@HansRosenberg74)

[Keys to Control Noise, Interference and EMI in PC Boards - Hartley](https://youtu.be/ZYUYOXmo9UU?si=TJTn7uMxdg90k0n1)

[How to Achieve Proper Grounding - Rick Hartley - Expert Live Training (US)](https://www.youtube.com/watch?v=ySuUZEjARPY)

[Common PCB Layout Mistakes that Cause EMC Compliance Failures - AltiumLive 2022](https://www.youtube.com/watch?v=Cc85IzyUfjA)

[Proper capacitive decoupling "You must Unlearn what You have Learned"](https://www.youtube.com/watch?v=y4REmZlE7Jg)

[Common PCB Layout Mistakes that Cause EMC Compliance Failures - AltiumLive 2022](https://www.youtube.com/watch?v=Cc85IzyUfjA)

## Conflunece links
Below is a confluence page that is a very bare-bones summary of the guidance contained in several of the lectures linked at the end of this email.  If we want our reference designs to guide our customers toward useful implementation of our products in a way that will pass EMC compliance (and have better performance to best show off our technology), we need to use unbroken ground references underneath all digital, power, and high-frequency analog signals.  Power should be routed and coupled to unbroken return paths all the way to where power enters the PCB from an external power supply instead of being made into an ambiguous power plane wherever possible, i.e., power planes should be intentional decisions to solve individual problems, not a default method of power delivery.

<https://confluence.microchip.com/display/MCU16APP/MC+-+Grounding%2C+EMI%2C+and+Signal+Integrity>

In addition, we need to come to the present-day best practices for decoupling capacitors.  High-med-low values of SMT capacitors for decoupling power to devices is an antiquated practice that has worse performance than multiple med to high value SMT capacitors of the same footprints due to the difference in inductance between a high value TH capacitor and a high value SMT capacitor.  See the confluence page linked for graphs that show the performance difference with real-world SMT capacitors’ data sheets.

<https://confluence.microchip.com/display/MCU16APP/MC+-+Decoupling+Capacitor+Guidelines>

