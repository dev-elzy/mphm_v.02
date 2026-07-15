"use client";
import dynamic from "next/dynamic";

const SystemSettingsCockpit = dynamic(
  () => import("@/components/shared/SystemSettingsCockpit").then((mod) => mod.SystemSettingsCockpit),
  { ssr: false }
);

export default function SystemSettingsCockpitPage() {
  return <SystemSettingsCockpit />;
}
