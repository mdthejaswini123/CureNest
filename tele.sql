-- Set SQL mode and start transaction
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Set character set and collation
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: tele

-- Table structure for table Symptoms
CREATE TABLE Symptoms (
  Sid int(11) NOT NULL,
  Sname varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table Symptoms
INSERT INTO Symptoms (Sid, Sname) VALUES
(1,'Fever'), (2,'Cough'), (3,'Headache'), (4,'Chest Pain'), (5,'Shortness of Breath'),
(6,'Abdominal Pain'), (7,'Diarrhea'), (8,'Constipation'), (9,'Rash'), (10,'Sore Throat'),
(11,'Nausea/Vomiting'), (12,'Fatigue'), (13,'Joint Pain'), (14,'Back Pain'), (15,'Dizziness'),(16, 'Menstrual Cramps'), (17, 'Mood Swings'),(18, 'Morning Sickness'),(19, 'Swelling or Bloating');


-- Table structure for table Patient_info
CREATE TABLE Patient_info (
  id int(11) NOT NULL,
  PName varchar(100) DEFAULT NULL,
  DOB varchar(20) DEFAULT NULL,
  Age int(11) DEFAULT NULL,
  Gender varchar(20) DEFAULT NULL,
  BloodGroup varchar(20) DEFAULT NULL,
  Symptoms varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Table structure for table Signup
CREATE TABLE Signup (
  Uid INT(11) NOT NULL,
  username varchar(20) DEFAULT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Table structure for table Disease
CREATE TABLE Disease (
  Did int(11) NOT NULL,
  Dname varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table Disease
INSERT INTO Disease (Did, Dname) VALUES
(1, 'Influenza'), (2, 'Common Cold'), (3, 'Migraine'), (4, 'Angina'), (5, 'Asthma'),
(6, 'Gastroenteritis'), (7, 'Food Poisoning'), (8, 'Functional Constipation'),
(9, 'Contact Dermatitis'), (10, 'Pharyngitis'), (11, 'Motion Sickness'), (12, 'Anemia'),
(13, 'Osteoarthritis'), (14, 'Muscle Strain'), (15, 'Vertigo'), (16, 'Heart Failure'),
(17, 'Bronchitis'), (18, 'Pneumonia'), (19, 'Mononucleosis'), (20, 'Rheumatoid Arthritis'),
(21, 'COVID-19'),(22, 'Menstruation'), (23, 'Pregnancy');


-- Table structure for table Preliminary_Medication
CREATE TABLE Preliminary_Medication (
  PMid int(11) NOT NULL,
  Medication varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table Preliminary_Medication
INSERT INTO Preliminary_Medication (PMid, Medication) VALUES
(1, 'Drink plenty of fluids like water, herbal teas, and broths. Use a lukewarm sponge bath or cold compress to reduce body temperature for Fever'),
(2, 'Honey and lemon in warm water, steam inhalation, or ginger tea for Cough'),
(3, 'Drink water, apply a cold compress to the forehead, or drink peppermint/ginger tea for Headache'),
(4, 'Warm compress or heating pad on the chest, deep breathing exercises, and drinking warm water with honey and lemon for Chest Pain'),
(5, 'Sit upright, practice slow deep breaths, drink peppermint or ginger tea for Shortness of Breath'),
(6, 'Drink warm water or herbal teas like peppermint or ginger, apply a warm compress to the abdomen for Abdominal Pain'),
(7, 'Drink oral rehydration solutions, follow BRAT diet (bananas, rice, applesauce, toast), drink ginger or chamomile tea for Diarrhea'),
(8, 'Increase fiber intake (fruits, vegetables, whole grains), drink plenty of water, and try warm water with lemon for Constipation'),
(9, 'Apply aloe vera or coconut oil, take oatmeal baths, avoid scratching for Rash'),
(10, 'Gargle with warm salt water, drink honey and lemon tea, stay hydrated for Sore Throat'),
(11, 'Sip ginger tea or chew ginger candies, stay hydrated with small sips of water or electrolyte drinks for Nausea/Vomiting'),
(12, 'Ensure proper rest and sleep, drink green tea, eat a balanced diet for Fatigue'),
(13, 'Apply warm or cold compresses, consume anti-inflammatory foods like turmeric and ginger, practice gentle stretches for Joint Pain'),
(14, 'Apply heating pad or cold compress, practice gentle stretches, maintain good posture for Back Pain'),
(15, 'Drink water, rest in a quiet place, eat small light meals for Dizziness'),
(16, 'Apply a warm compress on the abdomen, drink chamomile tea, avoid caffeine for Menstrual Cramps'),
(17, 'Get sufficient rest, practice relaxation techniques, consume a balanced diet for Mood Swings'),
(18, 'Eat small, frequent meals, stay hydrated, try ginger tea for Morning Sickness'),
(19, 'Elevate feet, reduce salt intake, stay hydrated for Swelling or Bloating');

-- Table structure for table SDMapping
CREATE TABLE SDMapping (
  SDid int(11) NOT NULL,
  Sid int(11) NOT NULL,
  Did int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table SDMapping

INSERT INTO SDMapping (Sid, Did) VALUES
-- Influenza
(1, 1), (2, 1), (3, 1),   -- Fever, Cough, Headache
-- Common Cold
(1, 2), (2, 2), (10, 2),  -- Fever, Cough, Sore Throat
-- Migraine
(3, 3), (15, 3), -- Headache, Dizziness
-- Angina
(4, 4), (5, 4), (12, 4), -- Chest Pain, Shortness of Breath, Fatigue
-- Asthma
(2, 5), (5, 5), -- Cough, Shortness of Breath
-- Food Poisoning
(6, 7), (7, 7), (11, 7), -- Abdominal Pain, Diarrhea, Nausea/Vomiting
-- Functional Constipation
(8, 8), -- Constipation
-- Contact Dermatitis
(9, 9), -- Rash
-- Motion Sickness
(15, 11), (11, 11), -- Dizziness, Nausea/Vomiting
-- Anemia
(12, 12), (15, 12), -- Fatigue, Dizziness
-- Osteoarthritis
(13, 13), (14, 13), -- Joint Pain, Back Pain
-- Muscle Strain
(14, 14), -- Back Pain
-- Vertigo
(15, 15), -- Dizziness
-- Bronchitis
(2, 17), (1, 17), (5, 17), -- Cough, Fever, Shortness of Breath
-- Pneumonia
(1, 18), (2, 18), (5, 18), -- Fever, Cough, Shortness of Breath
-- Mononucleosis
(1, 19), (10, 19), (12, 19), -- Fever, Sore Throat, Fatigue
-- Rheumatoid Arthritis
(13, 20), (12, 20), -- Joint Pain, Fatigue
-- COVID-19
(1, 21), (2, 21), (5, 21), -- Fever, Cough, Shortness of Breath
-- Menstruation
(16, 22),(17, 22), -- Menstrual Cramps ,Mood Swings
-- Pregnancy
(18, 23),(19, 23); -- Morning Sickness, Swelling or Bloating




-- Table structure for table DMMapping
CREATE TABLE DMMapping (
  DMId int(11) NOT NULL,
  Did int(11) NOT NULL,
  PMid int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO DMMapping (Did, PMid) VALUES
(1, 1),   -- Influenza -> Medication 1
(2, 2),   -- Common Cold -> Medication 2
(3, 3),   -- Migraine -> Medication 3
(4, 4),   -- Angina -> Medication 4
(5, 5),   -- Asthma -> Medication 5
(6, 6),   -- Gastroenteritis -> Medication 6
(7, 7),   -- Food Poisoning -> Medication 7
(8, 8),   -- Functional Constipation -> Medication 8
(9, 9),   -- Contact Dermatitis -> Medication 9
(10, 10), -- Pharyngitis -> Medication 10
(11, 11), -- Motion Sickness -> Medication 11
(12, 12), -- Anemia -> Medication 12
(13, 13), -- Osteoarthritis -> Medication 13
(14, 14), -- Muscle Strain -> Medication 14
(15, 15), -- Vertigo -> Medication 15
(16, 4),  -- Heart Failure -> Medication 4
(17, 2),  -- Bronchitis -> Medication 2
(18, 1),  -- Pneumonia -> Medication 1
(19, 10), -- Mononucleosis -> Medication 10
(20, 13), -- Rheumatoid Arthritis -> Medication 13
(21, 2),  -- COVID-19 -> Medication 2
(22, 16), -- Menstruation -> Medication 16
(23, 18); -- Pregnancy -> Medication 18



-- Indexes for table Symptoms
ALTER TABLE Symptoms
  ADD PRIMARY KEY (Sid);

-- Indexes for table Patient_info
ALTER TABLE Patient_info
  ADD PRIMARY KEY (id);

-- Indexes for table Signup
ALTER TABLE Signup
  ADD PRIMARY KEY (Uid);

-- Indexes for table Disease
ALTER TABLE Disease
  ADD PRIMARY KEY (Did);

-- Indexes for table Preliminary_Medication
ALTER TABLE Preliminary_Medication
  ADD PRIMARY KEY (PMid);

-- Indexes for table SDMapping
ALTER TABLE SDMapping
  ADD KEY (SDid),
  ADD KEY Sid (Sid),
  ADD KEY Did (Did);

-- Indexes for table DMMapping
ALTER TABLE DMMapping
  ADD KEY (DMid),
  ADD KEY Did (Did),
  ADD KEY PMid (PMid);

-- AUTO_INCREMENT for table Symptoms
ALTER TABLE Symptoms
  MODIFY Sid int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

-- AUTO_INCREMENT for table Patient_info
ALTER TABLE Patient_info
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- AUTO_INCREMENT for table Disease
ALTER TABLE Disease
  MODIFY Did int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

-- AUTO_INCREMENT for table Preliminary_Medication
ALTER TABLE Preliminary_Medication
  MODIFY PMid int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

-- AUTO_INCREMENT for table SDMapping
ALTER TABLE SDMapping
  MODIFY SDid int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- AUTO_INCREMENT for table DMMapping
ALTER TABLE DMMapping
  MODIFY DMid int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- AUTO_INCREMENT for table Signup
ALTER TABLE Signup
  MODIFY Uid int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- Foreign keys for table SDMapping
ALTER TABLE SDMapping
  ADD CONSTRAINT SDMapping_ibfk_1 FOREIGN KEY (Sid) REFERENCES Symptoms (Sid),
  ADD CONSTRAINT SDMapping_ibfk_2 FOREIGN KEY (Did) REFERENCES Disease (Did);

-- Foreign keys for table DMMapping
ALTER TABLE DMMapping
  ADD CONSTRAINT DMMapping_ibfk_1 FOREIGN KEY (Did) REFERENCES Disease (Did),
  ADD CONSTRAINT DMMapping_ibfk_2 FOREIGN KEY (PMid) REFERENCES Preliminary_Medication (PMid);

-- Commit transaction
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
