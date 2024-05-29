# Requirement
ㅇEach DOCTOR in the system is identified by a Doctor ID. A DOCTOR is associated with a specific medical Department, identified by the
Department ID. The DOCTOR has personal information such as Name, Address, Phone number, and a secure Password for system
access.
ㅇ A Nurse ID identifies NURSE entities. NURSEs are associated with a medical Department, specified by the Department ID. NURSEs also
have personal details including Name, Address, Phone number, and a Password for system authentication.
ㅇ Each PATIENT is uniquely identified by a Patient ID and is linked to a specific DOCTOR and NURSE through their respective IDs.
PATIENTs have personal information, including Name, Social Security Number, Gender, Address, Blood Type, Height, Weight, and Phone
Number. Additionally, each PATIENT has a Password for secure access to the system.
ㅇ The medical specialties offered by the hospital are represented in the MEDICAL SPECIALTY table. Each medical specialty is identified by
a unique Department ID. The table also stores the Department Name and Phone Number associated with each medical specialty.
ㅇ For patients requiring hospitalization, the INPATIENT table captures relevant information such as Room Information, Admission Date,
Discharge Date Time, and the corresponding Patient ID.
ㅇ To manage appointment scheduling, the RESERVATION table is utilized. Each reservation is uniquely identified by a Reservation number
and includes details such as Reservation Date Time, the Department ID for the medical specialty, and the associated Patient ID.
ㅇ EXAMINATION records are maintained for each medical examination conducted. The table includes information such as Examination Date
Time, Examination Details, and references to the attending DOCTOR and the corresponding PATIENT.
ㅇ TREATMENT entries capture details of treatments administered by NURSEs. The table includes Treatment Date Time, Treatment Details,
and references to the administering NURSE and the associated PATIENT.

-----------------------
#Project overview
ㅇRequired functionality
  - 아래 웹 페이지들을 구성한다
    1. DOCTOR, NURSE의 정보를 관리하는 관리자 페이지
    2. DOCTOR, NURSE가 각각 EXAMINATION, TREATMENT를 관리하고 조건에 맞는 PATIENT를 검색할 수 있는 직원 페이지
    3. PATIENT의 예약 조회 및 예약, 예약 확인을 위한 환자 페이지

1. 아래 기능들을 위한 요구사항을 추가한 후 ERD를 완성하여 제시하라
2. 아래 기능들을 구현하기 위한 제약조건, Index, 트랜젝션 등을 제시하라. (정규화 확인)
## 1. 관리자 페이지
  1. 관리자가 로그인 한 경우 DOCTOR, NURSE의 정보 입력/수정/삭제
## 2. 직원 페이지
  1. DOCTOR가 로그인 한 경우 EXAMINATION의 정보 입력/수정/삭제
  2. NURSE가 로그인 한 경우 TREATMENT의 정보 입력/수정/삭제
  3. DOCTOR 또는 NURSE가 로그인 한 경우 조건에 맞는 PATIENT를 검색
## 3. 환자 페이지
  1. PATIENT가 로그인 한 경우 예약하기, 예약조회, 예약취소
