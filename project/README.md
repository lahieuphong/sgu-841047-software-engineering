# Group 07 Flight-Ticket-Booking Project

Course-project materials for the Software Engineering course at Saigon University, preserving the original midterm submissions, Mermaid definitions, and supplied application prototype.

## Project materials

| Directory | Materials |
| --- | --- |
| [reports/midterm-first-submission/](reports/midterm-first-submission/) | [Word report](reports/midterm-first-submission/DeTaiL1_NopBaoCaoGiuaKyLan1_Nhom07_LaHieuPhong_3121411162.docx) |
| [reports/midterm-report/](reports/midterm-report/) | [Word report](reports/midterm-report/%5BQuanTrong%5D_NopDeTaiGiuaKy_N07.docx) · [PDF report](reports/midterm-report/%5BQuanTrong%5D_NopDeTaiGiuaKy_N07.pdf) |
| [diagrams/](diagrams/README.md) | 11 use-case flows, six activity flows, six sequence diagrams, and one architecture diagram |
| [source/](source/) | Express/MySQL backend and React frontend prototype |
| [../labs/](../labs/README.md) | Project survey, processes, proposal, plan, requirements, modeling, and system-design submissions |

Original document filenames, report contents, diagram section numbers, and diagram definitions are preserved. The first midterm report and Lab 5 differ in their cover titles while sharing the same extracted report body and embedded images.

## Source provenance

`source/` consolidates the supplied `Flight_Ticket_Booking` copy. All 22 files shared with `Flight-Ticket-Booking` were byte-identical before import. The unique Create React App README from the duplicate copy is retained in [source/frontend/README.md](source/frontend/README.md). Nested Git metadata and private environment configuration remain in the local import backup.

The supplied frontend displays a list of flights from `http://localhost:5001/api/flights`. The backend includes flight, authentication, and booking routes, with `server.js` as its entry point. There is no backend start script or implemented backend test suite in `package.json`.

The larger interface shown in the report is not contained in this source snapshot. The report appendix references these original project resources:

- [Flight Booking App source repository](https://github.com/lahieuphong/flight-booking-app)
- [Course presentation on Canva](https://www.canva.com/design/DAGn_pByQUA/aM5OIXNrawF1TqsebAp5fQ/edit)

The presentation is linked as an external resource; no presentation export was included in the imported directory.

## Configuration and known differences

[source/backend/.env.example](source/backend/.env.example) lists the required environment variables with placeholder values. Copy it to `.env` and supply local database settings and a private JWT secret when inspecting the backend. Local `.env` files and installed dependencies are excluded from version control.

The original source retains several incomplete integrations:

- Authentication signs tokens with a hard-coded example key, while booking routes verify against `JWT_SECRET`.
- Server and middleware logging includes secret or token values.
- Flight creation uses `from` and `to`, while booking-history queries use `from_location` and `to_location`.

These behaviors remain documented in the historical prototype. This import does not establish that all application features work together.

The [database-design SQL dump](../assignments/bt09a-database-design/QuanLyChuyenBay.sql) belongs to its coursework report and uses a different table structure from the prototype. It is not an application setup schema.

See [diagrams/README.md](diagrams/README.md) for the original diagram index and discrepancies retained for review.

## Import verification

The organized import preserves 91 original files byte for byte. Relative links in the six course and project indexes were checked, all eight backend JavaScript files passed syntax checks, and the frontend production build completed successfully using the supplied dependencies. Authenticated API flows and database integration were not exercised.

[Back to the course repository](../README.md).
