import { sqliteTable, text, integer } from "drizzle-orm/sqlite-core";
import { sql } from "drizzle-orm";

// ============================================================
// SYSTEM SETTINGS (Global Configuration & Parameters)
// ============================================================
export const systemSettings = sqliteTable("system_settings", {
  key: text("key").primaryKey(), // e.g., 'systemMaintenance', 'showMustahiqScores'
  value: text("value"), // Stored as JSON string
  updatedAt: integer("updated_at", { mode: "timestamp" }).default(sql`(strftime('%s', 'now'))`),
});
