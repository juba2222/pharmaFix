📜 PharmaFix Advanced Architecture Guide
1. Core Philosophy: DRY & Atomic Standard
• Rule: Any logic or UI used more than twice MUST be moved to lib/core/.
• State Management: Unified BLoC patterns using only four standard states: Initial, Loading, Success<T>, and Failure.
• UI Strategy: Atomic Design (Small, reusable widgets). Prohibited to use raw Flutter widgets (Container, Text) for standard elements; use lib/core/widgets/.
2. Global Code Reuse & Inheritance
• A. Base Models & Entities:
    ◦ All Entities MUST extend BaseEntity (for id, createdAt) and Equatable.
    ◦ All Models MUST extend their respective Entity and include copyWith.
• B. Shared UI (Atomic Widgets):
    ◦ Mandatory reuse from lib/core/widgets/ (e.g., CustomTextField, PrimaryButton).
    ◦ Check core widgets before creating any new UI component.
• C. Shared Logic:
    ◦ Use Mixins for shared logic (e.g., ValidationMixin).
    ◦ Use BaseLocalDataSource for generic CRUD operations.
3. Mandatory Path Mapping
File Type: Mandatory Directory Path
Domain (Logic): lib/features/[f]/domain/ (Entities, Repositories, UseCases)
Data (Implementation): lib/features/[f]/data/ (Models, Repositories Impl, DataSources)
Logic (BLoC): lib/features/[f]/presentation/bloc/
UI (Pages): lib/features/[f]/presentation/pages/
UI (Components): lib/features/[f]/presentation/widgets/
Core Components: lib/core/[widgets/base/database/error]/
4. Layer Enforcement (The Three-Layer Contract)
Layer -> Rule -> Mandatory Constraint
Domain -> Pure Dart Only -> Zero Flutter/Drift imports. Immutable entities.
Data -> Implementation -> Return Either<Failure, T>. Never throw exceptions.
Presentation -> BLoC + Widgets -> Zero logic in widgets. Communication via Events/States only.
5. Constraints for AI Generation (Antigravity Rules)
• File Limits: No single file should exceed 60 lines. Functions max 15 lines.
• Atomic Step Rule: AI strictly forbidden from generating a full feature at once. Follow this sequence:
    1. Entity -> 2. Model -> 3. Repository Contract -> 4. BLoC Logic -> 5. UI.
• One Class Per File: No nesting multiple classes in a single .dart file.
6. Database & Schema Enforcement (Drift DSL)
• Zero Tolerance for Raw Strings: Never use raw SQL or strings for queries/columns.
• Constant Requirement: Use TableConstants (e.g., TableConstants.medicineName).
• Structure: One table class per file under lib/core/database/tables/.
7. Reliability & Audit Protocols
• A. Self-Verification: Before output, verify: Length < 60 lines, No logic in UI, No hardcoding, GetIt for DI.
• B. Documentation:
    ◦ Start every file with a Header (Purpose, Layer, Dependencies).
    ◦ Update PROJECT_STATE.md and FEATURE_MAP.md after every task.
• C. Dependency Injection: Register every new service/BLoC in injection_container.dart immediately.
    ◦ AI Message: "I have updated injection_container.dart with the new dependency."
8. Strict Prohibitions (The Forbidden List)
• ❌ No Logic in UI: Zero arithmetic or filtering inside presentation.
• ❌ No Direct Access: Widgets never access Repositories or Data Sources.
• ❌ No Global Variables: Forbidden outside of class scopes.
• ❌ No Logic in Navigators: onTap only dispatches Events.

9  Pinecone RAG Sync Protocol (Memory Persistence)
A. The "Sync-Trigger" Rule
Rule: After every successful build_runner or completion of a Feature Layer (Domain/Data/Presentation), the AI MUST perform an Upsert to Pinecone.

Content to Upsert:
Logical Schema: New tables, DAOs, or API contracts.
Business Rules: Specific logic (e.g., "Discount cannot exceed 50%").
Dependency Map: How the new feature is registered in injection_container.dart.

B. Metadata Tagging
Every upserted vector should be tagged with:
layer: (e.g., data, domain, presentation)
feature: (e.g., inventory, sales, auth)
status: stable

D. Memory Integrity (Overwrite Rule):
Rule: Before performing an Upsert for a modified file or logic, the AI must ensure it is replacing the old vector or updating the metadata to status: deprecated for the previous version.
Goal: To prevent "Conflicting Contexts" where the RAG returns two different ways to do the same thing.

C. Context Verification
Before starting a new task, the AI must run a Similarity Search in Pinecone to retrieve related previous logic, ensuring the new code doesn't duplicate or contradict existing patterns.
Rule: No code generation is allowed without a "Context Match".
Definition: A Context Match is a successful retrieval from Pinecone that confirms the proposed code follows the established project patterns.
Penalty: If the AI generates code that contradicts the RAG memory (e.g., using a different state pattern), the task is considered a Hard Failure and must be rewritten.

E. Forced Evidence:
Rule: Every proposal must start with a "RAG Evidence Block".
Format: 
>   - [Source File Found]: (e.g., medicine_table.dart)
>   - [Rule Applied]: (e.g., Rule 9 - State Pattern)
>   - [Consistency Check]: (Confirmed: This new feature uses the same DAO structure found in the RAG).