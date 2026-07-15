"use client";

import dynamic from "next/dynamic";

const DashboardTab = dynamic(
  () => import("@/features/sekretariat/components/DashboardTab").then((mod) => mod.DashboardTab),
  { ssr: false }
);

export default function MufattisyDashboardPage() {
  return <DashboardTab />;
}
