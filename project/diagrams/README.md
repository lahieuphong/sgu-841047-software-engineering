# Original Project Diagrams

Twenty-four Markdown files containing the original Mermaid definitions from the midterm submission. Directory names describe the diagram roles; filenames retain report section numbers and UC/AC identifiers.

| Group | Diagram | Subject |
| --- | --- | --- |
| use-case-flows | [3.3.1.1_uc000](use-case-flows/3.3.1.1_uc000.md) | System overview |
| use-case-flows | [3.3.2.1_uc001](use-case-flows/3.3.2.1_uc001.md) | Flight search |
| use-case-flows | [3.3.2.2_uc002](use-case-flows/3.3.2.2_uc002.md) | Flight details |
| use-case-flows | [3.3.2.3_uc003](use-case-flows/3.3.2.3_uc003.md) | Booking information |
| use-case-flows | [3.3.2.4_uc004](use-case-flows/3.3.2.4_uc004.md) | Payment, as labeled in the report |
| use-case-flows | [3.3.2.5_uc005](use-case-flows/3.3.2.5_uc005.md) | Ticket issuance |
| use-case-flows | [3.3.2.6_uc006](use-case-flows/3.3.2.6_uc006.md) | Counter sales |
| use-case-flows | [3.3.2.7_uc007](use-case-flows/3.3.2.7_uc007.md) | Flight schedule intake |
| use-case-flows | [3.3.2.8_uc008](use-case-flows/3.3.2.8_uc008.md) | Airline and airport management |
| use-case-flows | [3.3.2.9_uc009](use-case-flows/3.3.2.9_uc009.md) | Revenue reports |
| use-case-flows | [3.3.2.10_uc010](use-case-flows/3.3.2.10_uc010.md) | Seat-class updates |
| activity | [3.6.1_ac001](activity/3.6.1_ac001.md) | Flight schedule intake |
| activity | [3.6.2_ac002](activity/3.6.2_ac002.md) | Ticket sales |
| activity | [3.6.3_ac003](activity/3.6.3_ac003.md) | Booking intake |
| activity | [3.6.4_ac004](activity/3.6.4_ac004.md) | Flight search |
| activity | [3.6.5_ac005](activity/3.6.5_ac005.md) | Revenue reports |
| activity | [3.6.6_ac006](activity/3.6.6_ac006.md) | Business-rule changes |
| sequence | [3.7.1_sequence001](sequence/3.7.1_sequence001.md) | Flight schedule intake |
| sequence | [3.7.2_sequence002](sequence/3.7.2_sequence002.md) | Ticket sales |
| sequence | [3.7.3_sequence003](sequence/3.7.3_sequence003.md) | Booking intake |
| sequence | [3.7.4_sequence004](sequence/3.7.4_sequence004.md) | Flight search |
| sequence | [3.7.5_sequence005](sequence/3.7.5_sequence005.md) | Revenue reports |
| sequence | [3.7.6_sequence006](sequence/3.7.6_sequence006.md) | Business-rule changes |
| architecture | [4.1.1_3TierArchitecture](architecture/4.1.1_3TierArchitecture.md) | Three-tier web application |

## Notes on the original definitions

The `use-case-flows/` files contain flowcharts for use-case scenarios. The six `activity/` files retain the original `stateDiagram-v2` notation. Diagram definitions are preserved without changes.

`3.3.2.3_uc003.md` and `3.3.2.4_uc004.md` are byte-identical, although the report distinguishes booking intake and payment. Both original identifiers are retained for comparison with the submitted report.

The architecture diagram labels the browser-to-backend connection as `SQL Query`; the backend API described in the report and source receives HTTP requests. This original label is retained as a documented discrepancy.

[Back to the project overview](../README.md).
