---
output: github_document
---
# National Park Analysis 

## Data Cleaning 

### Mortality Data 

We began by cleaning our data. The first dataset contains mortality data from National Parks, which we cleaned in the RMarkdown file 
'CleaningMortality.Rmd' within the /writing folder. After cleaning, we created a cleaned .csv called 'mortality_clean.csv' within 
the /data folder. 

Below is information on the mortality data set:

National Park Service Mortality data was accessed via https://www.nps.gov/aboutus/mortality-data.htm 
Data on deaths in National Parks from 207-2024 are contained within the /data folder in the file 
"NPS-Mortality-Data-CY2007-to-CY2024-Released-August-2024.xlsx".
Overview of data from the website: 

The NPS mortality dashboard includes data on incidents that met the following criteria:
• Reported between calendar year 2014 and 2019
• Validated by the NPS for official release
• The incident either began or ended within the park’s boundary
• The individual was not on-duty (i.e., working) at the time of the incident 
The dashboard exclude:
• Incidents that began and ended outside park boundaries (e.g., NPS law enforcement
aids a local law enforcement agency in the local community)
• On-duty NPS employees, volunteers, contractors, and concessioners
• On-duty employees, volunteers, and contractors of another agency/entity
• Data from calendar year 2007 to 2013 that is not validated
• Data from calendar year 2020 to the present that is not validated  

#### DATA DICTIONARY 

**Intent**
Identifies whether a death was caused by a purposeful act, an unplanned/unintended act, or a natural/medical event.

**Categories**

- Intentional – purposeful harmful actions upon oneself (suicide), others (homicide), or due to legal intervention. 

- Medical – natural or medical causes (e.g., seizure, heart attack), during activity or sedentary. 

- Unintentional – unintended harmful events including exposure to kinetic, thermal, electrical, or chemical energy (e.g., drowning, MVC, fall, poisoning). 

- Undetermined – intent cannot be determined due to one of the following: 

  - Official classification = “Undetermined” 
  
  - Insufficient incident information 
  
  - Restricted record 
  
  - Data comes from an outside agency 
  
**Cause of Death** 

The NPS mortality dashboard reports the underlying cause of death, rather than the direct cause of death. This aligns with the Center for Disease Control and Prevention (CDC) Webbased Injury Statistics Query and Reporting System2. Please refer to the Coding Updates section for changes to the data set.3 Underlying cause refers to what starts the chain of events that leads to an injury. Direct cause is what produces the actual physical harm.
One of our goals in creating the dashboard is to inform injury prevention efforts. Preventing the underlying cause can stop the injury from occurring in the first place. 

- Drowning – death from respiratory impairment caused by inhaling water when
submersed or immersed in liquid. It includes drownings due to water vessel accidents (e.g., kayak capsizes and the person
drowns). It excludes drownings due to:

  - Fall into water (coded as Fall)
  
  - Cataclysm (e.g., drowning during a flashflood is coded as Flash Flood which is nested under Environmental cause of death)
  
  - Motor vehicle crash (coded as Motor Vehicle Crash, Most Harmful Event = Noncollision, Immersion)
  
- Environmental – umbrella category for death associated with one of the following environmental causes: altitude, avalanche, falling ice, falling tree/branch, flash flood, heat, cold, landslide, lightning, rock fall, and sunburn.

- Fall – death from descending abruptly due to the force of gravity and striking a surface at the same or lower level. It also includes incidents where the individual:

  - Unintentionally falls into a body of water causing drowning and submersion, except when the fall occurs from a water vessel (coded as either Drowning or Vessel Incident depending on the nature of the death)
  
  - Intentionally jumps or dives into a body of water, with the intent to recreate, causing drowning and submersion, including jumping or diving from a water vessel.
  
- Homicide – death from injuries inflicted by another person with intent to injure or kill, by any means. It excludes injuries due to legal intervention. 

- Legal Intervention – fatal injuries inflicted by the police or other law-enforcing agents, including military on duty, in the course of arresting or attempting to arrest lawbreakers, suppressing disturbances, maintaining order, and other legal actions. Excludes injuries caused by civil insurrections.

- Medical - during physical activity - a medical death while the victim was engaged in physical activity (e.g., hiking, swimming, climbing).

- Medical - not during physical activity - a medical death while the person was not engaged in physical activity (e.g., sleeping, eating, passenger of a vehicle).

-  Medical - unknown - a medical death where it is unknown whether the person was participating in a physical activity at the time of the incident. 
- Motor vehicle crash – death in an incident involving one or more motor vehicles traveling on a traffic way. Table 1 is a list of motor vehicles, as defined in 36 C.F.R. § 1.4 that would make a crash eligible to be included in the MVC dashboard.  

- Other - death from a cause that does not fall under one of the eight historical categories developed by the NPS Public Risk Management Program. Specific causes include electrocution, fire, asphyxiation, and struck by/against.  

- Other Transportation – an umbrella category that includes deaths in an incident that involved one or more mode of transportation except a motor vehicle. Modes of transportation include the following as defined in 36 C.F.R. § 1.4:

  - Vehicle (e.g., bicycle only crash)
  
  - Water vessel (e.g., boat fire)
  
  - Aircraft (e.g., helicopter crashes into mountain)
  
  - Device (e.g., train runs over a person on the tracks) 
  
- Poisoning – death from ingestion, inhalation, absorption through the skin, or injection of so much of a drug, toxin, or other chemical that it results in a harmful effect.

- Suicide - death from injuring oneself with the intent to die.

- Wildlife – death from encounter (e.g., bite, sting, butting, mauling) with an animal. 

**Activities**

This section has definitions for activities that are not commonly used or known by the public.
Some activities, such as Diving, may be further categorized [e.g., Diving (Land) and Diving (Water vessel)] due to specific risks associated with each and how interventions can be applied.

- Diving (Land) – diving or jumping from cliffs and other land-based surfaces into a body of water.

- Diving (Water vessel) – diving or jumping from a water vessel (e.g., boat, raft, jet ski) into a body of water.

- Illegal Activity - an act committed in violation of the law. Examples include illegally crossing the United States border and theft.

- Other - an activity for which a specific code does not exist in the Visitor Injury Data System (VIDS). Examples include spending time in a hotel room and watching television.

- Vessel Related - watercraft activity including boating, kayaking, canoeing, rafting, sailing, and surfing.  

- If a combinations of different categories is not in this table, it indicates that there is not reported deaths for this combination in this dataset.

### National Park Data 

We also cleaned data on National Park regions and annual visitor counts. The RMarkdown file 'Cleaning_National_Park.Rmd' within 
the /writing folder contains this cleaning process. After cleaning, we created a cleaned .csv called 'NPVisitCleaned.csv' within the 
/data folder. 

Below is information on the dataset and data dictionary:  

This week's data is from [dataisplural/data.world](https://data.world/inform8n/us-national-parks-visitation-1904-2016-with-boundaries).

# Data Dictionary

## `national_parks.csv`

|variable          |class     |description |
|:-----------------|:---------|:-----------|
|year_raw          |integer | Year of record |
|gnis_id           |character | ID for shapefile and long-lat lookup |
|geometry          |character | Geometric shape for shapefile |
|metadata          |character | URL to metadata about the park |
|number_of_records |double    | Number of records |
|parkname          |character | Full park name |
|region            |character | US Region where park is located |
|state             |character | State abbreviation |
|unit_code         |character | Park code abbreviation |
|unit_name         |character | Park Unit name |
|unit_type         |character | Park unit type |
|visitors          |double    | Number of visitors |

## `state_pop.csv`

|variable |class     |description |
|:--------|:---------|:-----------|
|year     |integer   | Jan 1st of year |
|state    |character | State abbreviation |
|pop      |double    | Population |

## `gas_price.csv`

|variable     |class  |description |
|:------------|:------|:-----------|
|year         |double | Year (Jan 1st) |
|gas_current  |double | Gas price in that year (dollars/gallon) |
|gas_constant |double | Gas price (constant 2015 dollars/gallon) |

## `locations.csv`

|variable     |class  |description |
|:------------|:------|:-----------|
|lon          |double | longitude |
|lat          |double | latitude |
|gnis_id           |character | ID for shapefile and long-lat lookup |


## Analysis 

Within both the files **Cleaning_National_Park.Rmd** and **CleaningMortality.Rmd** (located within the `/writing` folder) we conducted exploratory analysis to look through our data. 

We then created a FlexDashboard to display our analysis. We first created separate Rmarkdown files to create individual components which would go inside the Dashboard, within the files **MapInteractive.Rmd** and **MortalityTable.Rmd**. The Flexdashboard  includes all code used to produce the visualizations from the cleaned datasets we produced in the prior step, as well as a new textfile explaining the data and key findings. This FlexDashboard is contained within the **Flex_Dashboard** file (located within the `/writing` folder).  

